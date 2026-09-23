# Anchor — iOS build

The whole app is one file, `www/index.html`. Capacitor wraps it in a native iOS shell
(WKWebView) so it can go on the App Store, use haptics, the status bar, the keyboard and
splash-screen plugins, and play sound with the silent switch on.

The iOS project uses Swift Package Manager (`ios/App/CapApp-SPM`). There is no Podfile and
no `.xcworkspace`; open `ios/App/App.xcodeproj`.

## One-time setup on your Mac

1. Install Xcode from the App Store, open it once, accept the licence.
2. Install Node (https://nodejs.org).
3. Clone this repo (or in Xcode: File → Clone, paste the GitHub URL).
4. In the repo folder:
   ```
   npm install
   npm run sync        # npx cap sync ios: copies www/ and registers the plugins
   npm run open        # opens ios/App/App.xcodeproj
   ```
5. In Xcode: select the App target → Signing & Capabilities → pick your team
   (a free Apple ID works for your own phone; the $99/yr developer account is needed for TestFlight and the App Store).
6. Plug in your iPhone, pick it as the run target, press ▶.

## Every time you change the web app

```
# edit www/index.html
npm run copy          # or npm run sync if you added a plugin
```
then run again from Xcode.

## What is already wired up natively

- `AppDelegate.swift` sets the audio session to `.playback` (mixing with other audio) so the
  synthesised sounds play with the silent switch on, and re-asserts it whenever the app becomes active
  (via `UIApplication.didBecomeActiveNotification`, since the app uses the scene lifecycle).
- `Info.plist`: iPhone only, portrait only, `UIRequiresFullScreen`, `ITSAppUsesNonExemptEncryption = NO`, automatic light/dark.
- `PrivacyInfo.xcprivacy`: no tracking, no collected data, no required-reason APIs.
- The web view background follows the same adaptive colour (set in `SceneDelegate.swift`).
- Launch screen is a plain adaptive colour (`LaunchBackground`, linen / espresso) that matches the page,
  so there is no white flash before the web view paints.
- App icon: the brand orb on linen (`Assets.xcassets/AppIcon.appiconset`).
- Capacitor plugins: Haptics, StatusBar (follows light/dark), Keyboard (native resize, no accessory bar),
  App (pauses Web Audio in the background), SplashScreen.

## Before submitting to the App Store

- **Billing is a placeholder.** The paywall in `onbPaywall()` flips a local flag with no transaction.
  Replace it with StoreKit (for example RevenueCat's Capacitor plugin) and only set the tier on a
  verified transaction; wire "Restore purchases" to the store. Apple rejects non-functional purchase flows.
- Fill in `YOUR_NAME`, `YOUR_ADDRESS` and `YOUR_EMAIL` in the Terms text inside `www/index.html`
  (`npm run check` fails while they are still there).
- App Store Connect: privacy label "Data not collected", a privacy-policy URL (the Terms text can be hosted as-is),
  Health & Fitness category, age rating, subscription products matching the prices on the paywall,
  6.7" and 6.5" screenshots.
- Keep the "not treatment, not a diagnosis" language on the home screen, in the FAQ and in every
  Learn more sheet. Apple reviews health apps against guideline 1.4.1 and rejects anything that claims
  to treat a disorder.

## Shipping

- Product → Archive → Distribute App → App Store Connect → TestFlight first.

## Later, if you outgrow the web view

The game logic is plain JS with no framework, so each game can be ported to SwiftUI
one at a time behind the same home screen. Capacitor lets native and web screens coexist.
