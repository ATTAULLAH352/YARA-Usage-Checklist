rule Test_Rule
{
    meta:
        description = "Simple test rule"
        author = "YourName"
        date = "2025-11-06"

    strings:
        $hello = "hello world"
    condition:
        $hello
}
