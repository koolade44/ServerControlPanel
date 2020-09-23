

<# This form was created using POSHGUI.com  a free online gui designer for PowerShell
.NAME
    Untitled
#>

Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$minram = "-Xms" + (Get-Content ServerConfig.txt)[0] -replace 'Min-RAM=', ''
$maxram = "-Xmx" + (Get-Content ServerConfig.txt)[1] -replace 'Max-RAM=', ''
$jarn = (Get-Content ServerConfig.txt)[2] -replace 'Server-Jar-File=', ''

function Update-SeverProp {
	if ($CheckBox1.Checked) {
	$cr = 'false'
	}
	else {
	$cr = 'true'
	}
	if ($CheckBox2.Checked) {
	$cmdb = 'true'
	}
	else {
	$cmdb = 'false'
	}
	if ($CheckBox3.Checked) {
	$pvp = 'true'
	}
	else {
	$pvp = 'false'
	}
	if ($CheckBox4.Checked) {
	$flight = 'true'
	}
	else {
	$flight = 'false'
	}
	if ($CheckBox5.Checked) {
	$fgm = 'true'
	}
	else {
	$fgm = 'false'
	}
	if ($ComboBox1.SelectedIndex -eq 0) {
	$gm = 'survival'
	}
	elseif ($ComboBox1.SelectedIndex -eq 1) {
	$gm = 'creative'
	}
	$motd = $TextBox1.text
	echo "#Minecraft server properties
#(last boot timestamp)
enable-jmx-monitoring=false
rcon.port=25575
level-seed=
gamemode=$gm
enable-command-block=$cmdb
enable-query=false
generator-settings=
level-name=world
motd=$motd
query.port=25565
pvp=$pvp
generate-structures=true
difficulty=easy
network-compression-threshold=256
max-tick-time=60000
max-players=20
use-native-transport=true
online-mode=$cr
enable-status=true
allow-flight=$flight
broadcast-rcon-to-ops=true
view-distance=10
max-build-height=256
server-ip=
allow-nether=true
server-port=25565
enable-rcon=false
sync-chunk-writes=true
op-permission-level=4
prevent-proxy-connections=false
resource-pack=
entity-broadcast-range-percentage=100
rcon.password=
player-idle-timeout=0
force-gamemode=$fgm
rate-limit=0
hardcore=false
white-list=false
broadcast-console-to-ops=true
spawn-npcs=true
spawn-animals=true
snooper-enabled=true
function-permission-level=2
level-type=default
spawn-monsters=true
enforce-whitelist=false
resource-pack-sha1=
spawn-protection=16
max-world-size=29999984" > server.properties
}

function Open-Folder {
start .\
}

function Start-Server {
	$jarex = Test-Path -Path .\$jarn
	if ($jarex -eq $True) {
	New-Item -Path ".\" -Name "eula.txt" -ItemType "file" -Value "eula=true"
	start powershell "java -jar $maxram $minram $jarn nogui"
	$Form.Close()
	}
	else {
	msg $Env:USERNAME please name your server jar file server.jar
	}
}

$Form                            = New-Object system.Windows.Forms.Form
$Form.ClientSize                 = New-Object System.Drawing.Point(733,462)
$Form.text                       = "Form"
$Form.TopMost                    = $false
$Form.BackColor                  = [System.Drawing.ColorTranslator]::FromHtml("#474747")

$ComboBox1                       = New-Object system.Windows.Forms.ComboBox
$ComboBox1.text                  = "Game Mode"
$ComboBox1.width                 = 100
$ComboBox1.height                = 20
@('Survival','Creative') | ForEach-Object {[void] $ComboBox1.Items.Add($_)}
$ComboBox1.location              = New-Object System.Drawing.Point(9,32)
$ComboBox1.Font                  = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$ComboBox1.BackColor             = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")

$CheckBox1                       = New-Object system.Windows.Forms.CheckBox
$CheckBox1.text                  = "Cracked"
$CheckBox1.AutoSize              = $false
$CheckBox1.width                 = 95
$CheckBox1.height                = 20
$CheckBox1.location              = New-Object System.Drawing.Point(9,86)
$CheckBox1.Font                  = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$CheckBox1.ForeColor             = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")

$CheckBox2                       = New-Object system.Windows.Forms.CheckBox
$CheckBox2.text                  = "Command Blocks"
$CheckBox2.AutoSize              = $false
$CheckBox2.width                 = 135
$CheckBox2.height                = 20
$CheckBox2.location              = New-Object System.Drawing.Point(9,136)
$CheckBox2.Font                  = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$CheckBox2.ForeColor             = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")

$CheckBox3                       = New-Object system.Windows.Forms.CheckBox
$CheckBox3.text                  = "PVP"
$CheckBox3.AutoSize              = $false
$CheckBox3.width                 = 95
$CheckBox3.height                = 20
$CheckBox3.location              = New-Object System.Drawing.Point(9,239)
$CheckBox3.Font                  = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$CheckBox3.ForeColor             = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")

$CheckBox4                       = New-Object system.Windows.Forms.CheckBox
$CheckBox4.text                  = "Flight"
$CheckBox4.AutoSize              = $false
$CheckBox4.width                 = 95
$CheckBox4.height                = 20
$CheckBox4.location              = New-Object System.Drawing.Point(9,191)
$CheckBox4.Font                  = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$CheckBox4.ForeColor             = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")

$CheckBox5                       = New-Object system.Windows.Forms.CheckBox
$CheckBox5.text                  = "Force Gamemode"
$CheckBox5.AutoSize              = $false
$CheckBox5.width                 = 145
$CheckBox5.height                = 20
$CheckBox5.location              = New-Object System.Drawing.Point(125,35)
$CheckBox5.Font                  = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$CheckBox5.ForeColor             = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")

$TextBox1                        = New-Object system.Windows.Forms.TextBox
$TextBox1.multiline              = $false
$TextBox1.text                   = "Server MOTD Here"
$TextBox1.width                  = 272
$TextBox1.height                 = 20
$TextBox1.location               = New-Object System.Drawing.Point(9,290)
$TextBox1.Font                   = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

$Button1                         = New-Object system.Windows.Forms.Button
$Button1.text                    = "Apply settings"
$Button1.width                   = 127
$Button1.height                  = 26
$Button1.location                = New-Object System.Drawing.Point(11,319)
$Button1.Font                    = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$Button1.BackColor               = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")

$Button2                         = New-Object system.Windows.Forms.Button
$Button2.text                    = "Start server"
$Button2.width                   = 124
$Button2.height                  = 45
$Button2.location                = New-Object System.Drawing.Point(598,407)
$Button2.Font                    = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$Button2.BackColor               = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")

$Label1                          = New-Object system.Windows.Forms.Label
$Label1.text                     = "Please make sure you have a server jar file named server.jar at this directory"
$Label1.AutoSize                 = $true
$Label1.width                    = 25
$Label1.height                   = 10
$Label1.location                 = New-Object System.Drawing.Point(26,435)
$Label1.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$Label1.ForeColor                = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")

$Button3                         = New-Object system.Windows.Forms.Button
$Button3.text                    = "Open Folder"
$Button3.width                   = 90
$Button3.height                  = 20
$Button3.location                = New-Object System.Drawing.Point(500,433)
$Button3.Font                    = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$Button3.BackColor               = [System.Drawing.ColorTranslator]::FromHtml("#ffffff")

$Form.controls.AddRange(@($ComboBox1,$CheckBox1,$CheckBox2,$CheckBox3,$CheckBox4,$CheckBox5,$TextBox1,$Button1,$Button2,$Label1,$Button3))

$Button1.Add_Click({ Update-SeverProp })
$Button3.Add_Click({ Open-Folder })
$Button2.Add_Click({ Start-Server })

$Form.ShowDialog()