Add these keys in Xcode: target App → Info tab → "+" (or edit ios/App/App/Info.plist)

NSMotionUsageDescription
  "Anchor uses tilt for the balance-style games."

UIRequiresFullScreen  = YES
UISupportedInterfaceOrientations = Portrait only (remove landscape entries)
ITSAppUsesNonExemptEncryption = NO   (avoids the export-compliance question on every upload)
