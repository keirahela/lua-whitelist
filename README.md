# this is not a functional lua whitelist, it's just helpers (mostly for roblox)

## DESIGNED FOR SYNAPSE X

> Description of Each
- Anti-CCLosure: Detects any function that is a CClosure (Detects hookfunction, newcclosure, etc.)
- Anti-LClosure: Detects any function that is an LClosure
- Hashing/Encoding Dumper: When cracking scripts, this dumps most basic encoding/encryption/hashing, works well on SHA.
- AES-No-Bit-Library: AES Encryption modified to work without the bit library, useful for webhosting
- GC-Anti-Hooking: Detects hooks via garbage collection
- Registry-Check-Bypass: Bypasses that getreg antihookfunc
- SHA256-Spoofer: Spoofs whitelist's that use SHA256 generically
