# Get reference to all image files
$images = Get-ChildItem -Recurse -Include *.jpg,*.jpeg,*.png . | Resolve-Path -Relative

# Create empty array
$imageArray = @()

# for each image, add filename and extension to array (file.extension)
foreach ($image in $images) {
    $imageArray += ($image | Resolve-Path -Relative).Replace('\', '/')
}

# Convert array to json and export to images.json
$fileContent = "var images = " + ($imageArray | ConvertTo-Json) + ";"
$fileContent > images.js

# Open index.html that should display the files
Start-Process .\index.html
