#!/bin/bash


display_help() {
    echo "Usage: $0 [options..] <mongo host> <db name> <storj bucket> " >&2
    echo
    echo "   -h, --help                 print this message"    
    echo
    exit 1
}

################################
# process the command line
################################
while :
do
    case "$1" in      
      -h | --help)
          display_help  # Call your function
          exit 0
          ;;     
      --) # End of all options
          shift
          break
          ;;
      -*)
          echo "Error: Unknown option: $1" >&2
          ## or call function display_help
          exit 1 
          ;;
      *)  # No more options
          break
          ;;
    esac
done






## set the env params
CMD="uplink_darwin_amd64 cp"  # Storj CLI cmd
HOST=$1  # DB Host
DBNAME=$2  # Database name
BUCKET=$3  # storj bucket name
TIME=`/bin/date +%d-%m-%Y-%T` # timestamp
DEST=/tmp/$USER/tmp     # Backup directory
TAR=$DEST/../$TIME.tar  # Tar file of backup directory


## function to run the backup against the data source
run_backup(){

   /bin/mkdir -p $DEST

   echo "backing up $HOST/$DBNAME to s3://$BUCKET/ on $TIME";

   # mongodb dump 
   for DBNAME in "${DBNAMES[@]}"
   do
      mongodump -h $HOST -d $DBNAME -o $DEST
   done

   tar cvf $TAR -C $DEST .

   # upload to storj network
   $CMD $TAR sj://$BUCKET/

   # Remove tar file locally
   #/bin/rm -f $TAR

   # Remove backup directory
   #/bin/rm -rf $DEST

   # All done
   echo "Backup available sj://$BUCKET/$TIME.tar"

}



run_backup
