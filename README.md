# Anchor — iOS build

The whole app is one file, `www/index.html`. Capacitor wraps it in a real iOS app
(WKWebView inside a native shell) so it can go on the App Store, use haptics and
device motion, and play sound with the silent switch on.

## One-time setup on your Mac

1. Install Xcode from the App Store, open it once, accept the licence.
2. Install Node (https://nodejs.org) and CocoaPods: `sudo gem install cocoapods`
3. Clone this repo (or in Xcode: File → Clone or Source Control → Clone, paste the GitHub URL).
4. In the repo folder:
   ```
   npm install
   npx cap add ios
   npx cap sync ios
   npx cap open ios
   ```
5. In Xcode: select the App target → Signing & Capabilities → pick your team
   (free Apple ID works for running on your own phone; $99/yr developer account for TestFlight/App Store).
6. Apply the two patches in `ios-patches/` (audio session + Info.plist keys).
7. Plug in your iPhone, pick it as the run target, press ▶.

## Every time you change the web app

```
# edit www/index.html
npx cap sync ios
```
then run again from Xcode. Commit and push as normal; Xcode's Source Control menu
handles GitHub directly.

## Shipping

- Product → Archive → Distribute App → App Store Connect → TestFlight first.
- App Store Connect needs: 6.7" and 6.5" screenshots, a privacy policy URL
  (say: no data leaves the device), and the Health & Fitness or Medical category.
- Keep the "not treatment, not a diagnosis" language on the home screen. Apple reviews
  health apps against guideline 1.4.1 and rejects anything that claims to treat a disorder.
- App Privacy questionnaire: "Data not collected." Everything is localStorage on-device.

## Later, if you outgrow the web view

The game logic is plain JS with no framework, so each game can be ported to SwiftUI
one at a time behind the same home screen. Capacitor lets native and web screens coexist.
