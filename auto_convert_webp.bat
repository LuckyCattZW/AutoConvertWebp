@echo off&setlocal enabledelayedexpansion

rem ѹ������
set compress=25

rem ԭʼͼƬ·��
set sroucePath=%~dp0sourceImages\

rem webp���·��
set outPath=%~dp0outWebpImages\

rem ����·��
set toolPath=%~dp0bin\

echo=
echo ��������sroucePathĿ¼�µ�.png��.jpg�ļ�
echo ��ִ��cwebpת������
echo=

rem ͳ��·���ַ�������
set /a max=8190,min=0
for /l %%a in (1,1,14) do (
     set /a "num=(max+min)/2"
     for /f "delims=" %%b in ("!num!") do if "!sroucePath:~%%b!" equ "" (set /a max=num) else set /a min=num
)
if "!sroucePath:~%num%!" neq "" set /a num+=1
::echo �������ַ���sroucePath����%num%���ַ�

rem ����·���µ�����png\jpg�ļ�
for /r %sroucePath% %%f in (*.png,*.jpg) do (
set filename=%%f
rem ִ��ת������
%toolPath%cwebp -q %compress% !filename! -o %outPath%!filename:~%num%, -4!.webp
)

echo=
echo �Ѿ��޸���ϣ�����
exit