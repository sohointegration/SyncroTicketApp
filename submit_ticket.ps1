Add-Type -assembly System.Windows.Forms
Add-Type -AssemblyName System.Drawing
Import-Module $env:SyncroModule -WarningAction Ignore
$subdomain = "YOURSUBDOMAIN"


# Creates Main Form
# The icon for the form automatically pulls from Syncro's logo.ico location
$main_form = New-Object System.Windows.Forms.Form
$main_form.Text ='Submit Ticket'
$main_form.Width = 850
$main_form.Height = 600
$main_form.Icon = "C:\ProgramData\Syncro\Images\logo.ico"
$main_form.AutoSize = $true

# Text box for ticket subject
$varIssue = New-Object System.Windows.Forms.TextBox
$varIssue.Location = '120,200'
$varIssue.Size = '590,30'
$varIssue.AutoSize = $true
$varIssue.Font = new-object system.drawing.font("Arial", 20)
$main_form.Controls.Add($varIssue)

# Text box for ticket Description
$varDescription = New-Object System.Windows.Forms.TextBox
$varDescription.Multiline = $True;
#.Scrollbars = "Vertical"
$varDescription.Location = '120,260'
$varDescription.Size = '590,100'
$varDescription.AutoSize = $true
$varDescription.Font = new-object system.drawing.font("Arial", 20)
$main_form.Controls.Add($varDescription)

# Picture / Logo
# This is image is taken from Syncro's default logo location
$picture = (get-item ("C:\ProgramData\Syncro\Images\logo.png"))
$img = [System.Drawing.Image]::Fromfile($picture)
$pictureBox = new-object Windows.Forms.PictureBox
$pictureBox.Width = '700'
$pictureBox.Height = '300'
$pictureBox.Image = $img
$pictureBox.Location = New-object System.Drawing.Size(100,20)
$main_form.controls.add($pictureBox)

# Submit Button
$Button = New-Object System.Windows.Forms.Button
$Button.Text = "Submit Ticket"
$Button.Location  = '600,550'
$Button.Font = new-object system.drawing.font("Arial", 14)
$Button.AutoSize = $true
$main_form.Controls.Add($Button)


# Ticket response label
$Label1 = New-Object System.Windows.Forms.Label
$Label1.Text = ""
$Label1.Location  = '120,600'
$label1.Font = new-object system.drawing.font("Arial", 10)
$Label1.AutoSize = $true
$main_form.Controls.Add($Label1)

$Button.Add_Click(
{

    $varSubject = $varIssue.Text
	$varDescription1 = $varDescription.Text
	$myticket = Create-Syncro-Ticket -Subdomain "$subdomain" -Subject "$varSubject" -IssueType "Other" -Status "New"
	$ticket = $myticket.ticket.number
	$Label1.Text = "Creating Ticket"
	Create-Syncro-Ticket-Comment -Subdomain "sohointegration" -TicketIdOrNumber $ticket -Subject "$varSubject" -Body "$varDescription1" -Hidden $False -DoNotEmail $False
	$varIssue.Text = "  Please wait while we process your request....   "
		
	$Label1.Text = "Your Ticket Number is: $ticket"
	$varIssue.Text = ""
    $varDescription.Text = ""
}
)

$main_form.ShowDialog()


