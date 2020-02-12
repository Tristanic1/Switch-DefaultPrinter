@echo off
cls

FOR /F "tokens=2* delims==" %%A in (
  'wmic printer where "default=True" get name /value'
  ) do SET DefaultPrinter=%%A

IF %DefaultPrinter%==\\printserver01\Secure-Print-Black-White-PCL (
	wmic printer where name='\\\\printserver01\\210-C-PCL' call setdefaultprinter 
	msg %username% "'210-C-PCL' has been set as Default printer"
	) ELSE (
	wmic printer where name='\\\\printserver01\\Secure-Print-Black-White-PCL' call setdefaultprinter 
	msg %username% "'Secure-Print-Black-White-PCL' has been set as Default printer"
	)
