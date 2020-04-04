dotnet clean

get-childitem -path D:\_oncuesoft\piranha.core -Filter *.nupkg -recurse | remove-item
get-childitem -path D:\_oncuesoft\packages\ -Filter *.* -recurse | remove-item -recurse
get-childitem -path D:\_oncuesoft\piranha.core\artifacts\ -Filter *.* -recurse | remove-item -recurse

dotnet build -c debug
dotnet build -c release
dotnet pack -c debug

cd D:\_oncuesoft\piranha.core

get-childitem -Filter *.nupkg -recurse | copy-item -destination D:\_oncuesoft\piranha.core\artifacts\

cd D:\_oncuesoft\piranha.core\artifacts

dotnet nuget locals all --clear

dotnet nuget push *.nupkg -s D:\_oncuesoft\packages

cd D:\_oncuesoft\piranha.core\artifacts

Write-Host "Done!" -ForegroundColor green
