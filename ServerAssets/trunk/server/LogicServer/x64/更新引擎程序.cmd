::此批处理仅供策划人员使用，将引擎程序更新到最新版本
@echo off 
svn update .\
copy /Y LogicServerCQ64_D.exe.new LogicServerCQ64_D.exe
copy /Y LogicServerCQ64_D.ilk.new LogicServerCQ64_D.ilk
copy /Y LogicServerCQ64_D.pdb.new LogicServerCQ64_D.pdb


@echo ***************************************
@echo                 同步更新完毕!
@echo ***************************************

pause