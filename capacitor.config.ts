import type { CapacitorConfig } from '@capacitor/cli';

const config: CapacitorConfig = {
  appId: 'co.winograd.anchor',   // change to your own reverse-domain id
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
