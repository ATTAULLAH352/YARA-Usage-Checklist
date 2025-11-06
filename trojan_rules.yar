rule Trojan_Sample_Example
{
    meta:
        description = "Detects common trojan strings"
        author = "YourName"
        date = "2025-11-06"
        tags = "trojan"

    strings:
        $a = "install_service" ascii nocase
        $b = "/tmp/.hidden" nocase
    condition:
        all of them
}
