@echo off
rem Starts AI_Analyst and opens its UI in the browser.
rem Stop it with Settings > Quit in the UI, or close this window.
cd /d "%~dp0"
AI_Analyst.exe --open %*
