#!/bin/bash

# Creates directories.
function create_dir() {
	DIR=$1

	if [ ! -d $USER_HOME"/"$DIR ]; then
		#echo "Creating directory "$DIR
		mkdir -p $USER_HOME"/"$DIR
	fi
}

# Creates symlinks between files.
function link_file() {
	LOCAL_FILE=$1
	REMOTE_FILE=$LOCAL_FILE
	LOCAL_DIR=$2
	REMOTE_DIR=$3

	#echo "FILE: "$LOCAL_FILE
	#echo "LOCAL_DIR: "$LOCAL_DIR
	#echo "REMOTE_DIR: "$REMOTE_DIR

	if [[ -z $REMOTE_DIR && ! -z $LOCAL_DIR ]]; then
		#echo "Local dir, but no remote dir specified"
		REMOTE_DIR=$LOCAL_DIR
	fi

	if [[ ! -z $LOCAL_DIR ]]; then
		LOCAL_FILE=$LOCAL_DIR"/"$LOCAL_FILE
	else
		LOCAL_FILE=$LOCAL_FILE
	fi

	if [[ ! -z $REMOTE_DIR ]]; then
		create_dir $REMOTE_DIR
		REMOTE_FILE=$REMOTE_DIR"/"$REMOTE_FILE
	else
		REMOTE_FILE=$REMOTE_FILE
	fi

	#echo "LOCAL_FILE (after): "$LOCAL_FILE
	#echo "REMOTE_FILE (after): "$REMOTE_FILE

	LINK_FILE=$CURRENT_DIR"/"$LOCAL_FILE
	TARGET_FILE=$USER_HOME"/"$REMOTE_FILE

	if [[ ! -f ${LINK_FILE} ]]
		then
		echo "ERROR: Link file does not exist:" ${LINK_FILE}
	fi

	# Check if file is not symlinked
	if [[ -f ${TARGET_FILE} && ! -L ${TARGET_FILE} ]]
		then
		echo "WARNING: File exists and is not symlink:" ${TARGET_FILE}
	fi

	# Create symlink
	if [[ ! -f ${TARGET_FILE} && -f ${LINK_FILE} ]]
		then
		echo "Linking "$LOCAL_FILE" to "$REMOTE_FILE
		ln -s "${LINK_FILE}" "${TARGET_FILE}"
	fi
}

# Creates symlinks between directories
function link_dir() {
	LOCAL_FILE=$1
	REMOTE_FILE=$LOCAL_FILE
	LOCAL_DIR=$2
	REMOTE_DIR=$3

	#echo "------- link dir ----------"
	#echo "FILE: "$LOCAL_FILE
	#echo "LOCAL_DIR: "$LOCAL_DIR
	#echo "REMOTE_DIR: "$REMOTE_DIR

	if [[ -z $REMOTE_DIR && ! -z $LOCAL_DIR ]]; then
		#echo "Local dir, but no remote dir specified"
		REMOTE_DIR=$LOCAL_DIR
	fi

	if [[ ! -z $LOCAL_DIR ]]; then
		LOCAL_FILE=$LOCAL_DIR"/"$LOCAL_FILE
	else
		LOCAL_FILE=$LOCAL_FILE
	fi

	if [[ ! -z $REMOTE_DIR ]]; then
		create_dir $REMOTE_DIR
		REMOTE_FILE=$REMOTE_DIR"/"$REMOTE_FILE
	else
		REMOTE_FILE=$REMOTE_FILE
	fi

	#echo "LOCAL_FILE (after): "$LOCAL_FILE
	#echo "REMOTE_FILE (after): "$REMOTE_FILE

	LINK_FILE=$CURRENT_DIR"/"$LOCAL_FILE
	TARGET_FILE=$USER_HOME"/"$REMOTE_FILE

	if [[ ! -d ${LINK_FILE} ]]
		then
		echo "ERROR: Link directory does not exist:" ${LINK_FILE}
	fi

	# Check if file is not symlinked
	if [[ -f ${TARGET_FILE} && ! -L ${TARGET_FILE} ]]
		then
		echo "WARNING: File exists and is not symlink:" ${TARGET_FILE}
	fi

	# Create symlink
	if [[ ! -d ${TARGET_FILE} && -d ${LINK_FILE} ]]
		then
		echo "Linking dir "$LOCAL_FILE" to "$REMOTE_FILE
		ln -s "${LINK_FILE}" "${TARGET_FILE}"
	fi
}
