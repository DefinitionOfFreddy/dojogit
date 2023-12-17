#!/bin/bash

. $(dirname "$BASH_SOURCE")/../00-config.sh

$SCRIPTDIR/01-bare.sh
$SCRIPTDIR/02-setup-commits.sh