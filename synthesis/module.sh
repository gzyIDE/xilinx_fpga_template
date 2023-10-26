#!/bin/tcsh

switch ( $TOP_MODULE )
	case "top" : 
		set TEST_FILE = ${TBDIR}/${TOP_MODULE}_test.sv
		set RTL_FILE = ( \
			${RTLDIR}/${TOP_MODULE}.sv \
      ${RTLDIR}/axi2lbus_bridge.sv \
		)
	breaksw


	default : 
		set TEST_FILE = ${TBDIR}/${TOP_MODULE}_test.sv
		set RTL_FILE = ( \
			${RTLDIR}/${TOP_MODULE}.sv \
		)
	breaksw
endsw
