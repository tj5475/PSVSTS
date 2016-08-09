$project = (Split-Path -Parent $MyInvocation.MyCommand.Path).Replace(".Tests", "")
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path).Replace(".tests.", ".")
. "$project\$sut"


Describe "AnswerToUltimateQuestion" {
	Context "Exists" {
		It "Runs" {
           #$actual = AnswerToUltimateQuestion 
	       #$actual | Should Be 42
			AnswerToUltimateQuestion | Should Be 42 
		}
	}
}