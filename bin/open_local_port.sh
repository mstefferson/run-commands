open -a Firefox "http://localhost:$2"
ssh -L $2:localhost:$2 aws-genentech-mstefferson
