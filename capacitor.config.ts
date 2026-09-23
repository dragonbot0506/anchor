import type { CapacitorConfig } from '@capacitor/cli';

const config: CapacitorConfig = {
  appId: 'co.winograd.anchor',   // change to your own reverse-domain id
  appName: 'Anchor',
  webDir: 'www',
  ios: {
    contentInset: 'never',
    backgroundColor: '#E8ECE9',
    preferredContentMode: 'mobile',
  },
};

export default config;
