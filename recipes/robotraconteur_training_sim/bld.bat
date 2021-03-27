@echo off

xcopy gz_example %PREFIX%\gz_example /E /H /I
cp %RECIPE_DIR%\run_2ur5e_sim.bat %LIBRARY_PREFIX%\bin\