@echo off&setlocal enabledelayedexpansion

rem 压缩比例
set compress=25

rem 原始图片路径
set sroucePath=%~dp0sourceImages\

rem webp输出路径
set outPath=%~dp0outWebpImages\

rem 工具路径
set toolPath=%~dp0bin\

echo=
echo 遍历所有sroucePath目录下的.png与.jpg文件
echo 并执行cwebp转换命令
echo=

rem 统计路径字符串数量
set /a max=8190,min=0
for /l %%a in (1,1,14) do (
     set /a "num=(max+min)/2"
     for /f "delims=" %%b in ("!num!") do if "!sroucePath:~%%b!" equ "" (set /a max=num) else set /a min=num
)
if "!sroucePath:~%num%!" neq "" set /a num+=1
::echo 经计算字符串sroucePath共有%num%个字符

rem 遍历路径下的所有png\jpg文件
for /r %sroucePath% %%f in (*.png,*.jpg) do (
set filename=%%f
rem 执行转换命令
%toolPath%cwebp -q %compress% !filename! -o %outPath%!filename:~%num%, -4!.webp
)

echo=
echo 已经修改完毕！！！
exit