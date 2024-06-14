# Função para encontrar o caminho da solução a partir do diretório do projeto
function FindSolutionDirectory {
    param (
        [string]$startDirectory
    )
  
    $currentDirectory = $startDirectory
    while ($currentDirectory -ne "") {
        $solutionFile = Get-ChildItem $currentDirectory -Filter *.sln
        if ($solutionFile) {
            return $solutionFile.DirectoryName
        }
        $currentDirectory = (Get-Item $currentDirectory).Parent.FullName
    }
  
    return ""
}
  
# Obter o caminho do diretório do projeto atual
$currentProjectDir = $PSScriptRoot
  
# Encontrar o caminho do diretório da solução a partir do diretório do projeto
$solutionDir = FindSolutionDirectory $currentProjectDir
  
if ($solutionDir -ne "") {
    Write-Host "Solution directory found: $solutionDir"
} else {
    Write-Host "Solution directory not found."
}
# Função para encontrar o nome do projeto a partir do diretório do projeto
function FindProjectName {
    param (
        [string]$startDirectory
    )
  
    $currentDirectory = $startDirectory
    while ($currentDirectory -ne "") {
        $projectFiles = Get-ChildItem $currentDirectory -Filter *.vcxproj
        if ($projectFiles) {
            return $projectFiles.Name.Replace(".vcxproj", "")
        }
        $currentDirectory = (Get-Item $currentDirectory).Parent.FullName
    }
  
    return ""
}
  
# Obter o caminho do diretório do projeto atual
$currentProjectDir = $PSScriptRoot
  
# Encontrar o nome do projeto a partir do diretório do projeto
$projectName = FindProjectName $currentProjectDir
  
if ($projectName -ne "") {
    Write-Host "Project name found: $projectName"
} else {
    Write-Host "Project name not found."
}
# Define paths
$projectFile = "$solutionDir\$projectName.vcxproj"
$nuspecFile = "$solutionDir\$projectName.nuspec"
$nugetOutputDirectory = "c:\nuget.local"
  
# Verifica se o diretório de saída do NuGet existe, se não, cria
if (-Not (Test-Path -Path $nugetOutputDirectory)) {
    New-Item -ItemType Directory -Path $nugetOutputDirectory
}
  
# Caminho para o msbuild.exe
$msbuildPath = "MSBuild.exe"
  
# Função para compilar e empacotar
function BuildAndPack {
     
    # Compilar o projeto
& $msbuildPath $projectFile /p:Configuration=Debug /p:Platform=x64 /p:UsePrecompiledHeaders=false /p:PlatformToolset=v143 /p:WindowsTargetPlatformVersion=10.0 /t:Build
    if ($LASTEXITCODE -ne 0) {
        Write-Error "Build failed for configuration: Debug"
        exit $LASTEXITCODE
    }
& $msbuildPath $projectFile /p:Configuration=Release /p:Platform=x64 /p:UsePrecompiledHeaders=false /p:PlatformToolset=v143 /p:WindowsTargetPlatformVersion=10.0 /t:Build
    if ($LASTEXITCODE -ne 0) {
        Write-Error "Build failed for configuration: Release"
        exit $LASTEXITCODE
    }
  
    # Empacotar o projeto usando NuGet
& nuget.exe pack $nuspecFile -OutputDirectory $nugetOutputDirectory
  
    if ($LASTEXITCODE -ne 0) {
        Write-Error "NuGet pack failed for configuration: $configuration"
        exit $LASTEXITCODE
    }
}
  
# Compilar e empacotar nas configurações Debug e Release
BuildAndPack
  
Write-Host "Build and packaging completed successfully."