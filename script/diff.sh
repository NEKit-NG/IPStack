for var in `find src -name \*.swift` ; do
	filename=${var##*/}
	case $filename in
		IPort.swift) echo $filename; diff $var ../NEKit/src/Utils/Port.swift;;
		*) src=`find ../NEKit/src -name $filename`
			if [ $src"TEST" == "TEST" ] ; then
				echo ERROR: $var
				echo 
			else
				echo $filename
				echo $src
				diff $var $src
				echo 
			fi
	esac
done
