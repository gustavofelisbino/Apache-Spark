$ErrorActionPreference = "Stop"

$projectRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$jdkRoot = "C:\Program Files\Eclipse Adoptium\jdk-17.0.19.10-hotspot"

if (-not (Test-Path (Join-Path $jdkRoot "bin\java.exe"))) {
    $jdkRoot = Get-ChildItem "C:\Program Files\Eclipse Adoptium" -Directory -ErrorAction SilentlyContinue |
        Where-Object { $_.Name -like "jdk-17*" } |
        Sort-Object Name -Descending |
        Select-Object -First 1 -ExpandProperty FullName
}

if (-not $jdkRoot -or -not (Test-Path (Join-Path $jdkRoot "bin\java.exe"))) {
    throw "JDK 17 not found. Install Temurin/OpenJDK 17 or set JAVA_HOME before running this script."
}

$hadoopHome = Join-Path $projectRoot ".hadoop"

if (-not (Test-Path (Join-Path $hadoopHome "bin\winutils.exe"))) {
    throw "winutils.exe not found in .hadoop\bin. Restore the local Hadoop Windows binaries before running Spark notebooks."
}

$env:JAVA_HOME = $jdkRoot
$env:HADOOP_HOME = $hadoopHome
$env:Path = "$env:JAVA_HOME\bin;$env:HADOOP_HOME\bin;$env:Path"

Set-Location $projectRoot
uv run jupyter lab
