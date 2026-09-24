import type { CapacitorConfig } from '@capacitor/cli';

const config: CapacitorConfig = {
  appId: 'com.leoprince.anchor',
  appName: 'Anchor',
  webDir: 'www',
  ios: {
    contentInset: 'never',
    backgroundColor: '#F6F0E8',
    preferredContentMode: 'mobile',
    allowsLinkPreview: false,
  },
  plugins: {
    SplashScreen: {
      launchShowDuration: 0,
      launchAutoHide: true,
      backgroundColor: '#F6F0E8',
      showSpinner: false,
    },
    Keyboard: {
      resize: 'native',
      resizeOnFullScreen: true,
    },
    StatusBar: {
      style: 'DEFAULT',
    },
  },
};

export default config;
