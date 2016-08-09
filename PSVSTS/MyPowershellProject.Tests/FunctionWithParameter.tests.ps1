$project = (Split-Path -Parent $MyInvocation.MyCommand.Path).Replace(".Tests", "")
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path).Replace(".tests.", ".")
. "$project\$sut"

Describe "FunctionWithParameter" {
	
   Context "When the file does not exist" {
 
         Mock Test-Path { $false } -Verifiable
 
         $actual = FunctionWithParameter -Path 'f:\scripts\blue.log'
 
         It "should return zeo" {
 
             $actual | Should Be 0
        }
 
        It "should call Test-Path once" {
             
             Assert-MockCalled Test-Path -Times 1 -Exactly
       }
}
	Context "When the file does exist" {
 
        Mock Test-Path { $true } -Verifiable -ParameterFilter { $Path -eq "file does exist" }
        Mock Get-ChildItem { @{ Length = 42 } } -Verifiable
 
       $actual = FunctionWithParameter -Path 'F:\scripts\cars.xml'
 
       It "should return the file length" {
 
        $actual | Should Be 42
     }
 
        It "should call Test-Path once" {
             
        Assert-MockCalled Test-Path -Times 1 -Exactly
     }
   }
}