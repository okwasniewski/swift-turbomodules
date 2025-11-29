import { TurboModuleRegistry, type TurboModule } from "react-native";

type LocalStorageConstants = {
  storageKey: string;
};

export interface Spec extends TurboModule {
  setItem(value: string, key: string): void;
  getItem(key: string): string | null;
  removeItem(key: string): void;
  clear(): void;

  getConstants(): LocalStorageConstants;
  getMyConstants(): LocalStorageConstants;
}

export default TurboModuleRegistry.getEnforcing<Spec>("LocalStorage");
