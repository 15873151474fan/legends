::此批处理仅供服务端程序使用，将生成的最新引擎程序
::拷贝成一个备份文件，然后用SVN命令提交
copy /Y LogicServerCQ64_D.exe LogicServerCQ64_D.exe.new
copy /Y LogicServerCQ64_D.ilk LogicServerCQ64_D.ilk.new
copy /Y LogicServerCQ64_D.pdb LogicServerCQ64_D.pdb.new
svn commit -m "提交引擎" "LogicServerCQ64_D.exe.new"
svn commit -m "提交引擎" "LogicServerCQ64_D.ilk.new"
svn commit -m "提交引擎" "LogicServerCQ64_D.pdb.new
@echo off 
@echo ***************************************
@echo                 提交执行完毕!
@echo ***************************************

pause