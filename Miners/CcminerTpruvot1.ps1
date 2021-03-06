$Path = '.\Bin\NVIDIA-TPruvot1\ccminer-x64.exe'
$Uri = 'https://github.com/tpruvot/ccminer/releases/download/2.2.5-tpruvot/ccminer-x64-2.2.5-cuda9.7z'

$Name = (Get-Item $script:MyInvocation.MyCommand.Path).BaseName

$Algorithms = [PSCustomObject]@{
    Lyra2z = 'lyra2z'
    #Equihash = 'equihash' #not supported
    Cryptonight = 'cryptonight'
    #Ethash = 'ethash' #not supported
    #Sia = 'sia'
    #Yescrypt = 'yescrypt'
    #BlakeVanilla = 'vanilla'
    #Lyra2RE2 = 'lyra2v2'
    #Skein = 'skein'
    Qubit = 'qubit'
    #NeoScrypt = 'neoscrypt'
    #X11 = 'x11'
    #MyriadGroestl = 'myr-gr'
    #Groestl = 'groestl'
    #Keccak = 'keccak'
    Scrypt = 'scrypt'
    Bitcore = 'bitcore'
    #Blake2s = 'blake2s'
    #Sib = 'sib'
    #X17 = 'x17'
    Quark = 'quark'
    Hmq1725 = 'hmq1725'
    #Veltor = 'veltor'
    #X11evo = 'x11evo'
    Timetravel = 'timetravel'
    #Blakecoin = 'blakecoin'
    #Lbry = 'lbry'
    Jha = 'jha'
    Skunk = 'skunk'
    Tribus = 'tribus'
    Phi = 'phi'
    #Hsr = 'hsr'
}

$Optimizations = [PSCustomObject]@{
    Lyra2z = ' -d $SplitSniffCC1'
    Equihash = ''
    Cryptonight = ' -d $SplitSniffCC1'
    Ethash = ''
    Sia = ''
    Yescrypt = ''
    BlakeVanilla = ''
    Lyra2RE2 = ' -d $SplitSniffCC1'
    Skein = ''
    Qubit = ' -d $SplitSniffCC1'
    NeoScrypt = ''
    X11 = ''
    MyriadGroestl = ''
    Groestl = ''
    Keccak = ' -d $SplitSniffCC1'
    Scrypt = ' -d $SplitSniffCC1'
    Bitcore = ' -d $SplitSniffCC1'
    Blake2s = ''
    Sib = ''
    X17 = ''
    Quark = ' -d $SplitSniffCC1'
    Hmq1725 = ' -d $SplitSniffCC1'
    Veltor = ''
    X11evo = ' -d $SplitSniffCC1'
    Timetravel = ' -d $SplitSniffCC1'
    Blakecoin = ''
    Lbry = ''
    Jha = ' -d $SplitSniffCC1'
    Skunk = ' -d $SplitSniffCC1'
    Tribus = ' -d $SplitSniffCC1'
    Phi = ' -i 23 -d $SplitSniffCC1'
    Hsr = ' -d $SplitSniffCC1'
    
}

$Algorithms | Get-Member -MemberType NoteProperty | Select -ExpandProperty Name | ForEach {
    [PSCustomObject]@{
        Type = 'NVIDIA1'
        Path = $Path
        Arguments = -Join ('-a ', $Algorithms.$_, ' -o stratum+tcp://$($Pools.', $_, '.Host):$($Pools.', $_, '.Port) -b 0.0.0.0:4069 -u $($Pools.', $_, '.User1) -p $($Pools.', $_, '.Pass1)', $Optimizations.$_)
        HashRates = [PSCustomObject]@{$_ = -Join ('$($Stats.', $Name, '_', $_, '_HashRate.Week)')}
        API = 'Ccminer'
        Port = 4069
        Wrap = $false
        URI = $Uri
    }
}
