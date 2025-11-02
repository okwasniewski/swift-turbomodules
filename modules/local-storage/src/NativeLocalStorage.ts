import {
  CodegenTypes,
  TurboModuleRegistry,
  type TurboModule,
} from "react-native";

export type KeyValuePair = {
  key: string;
  value: string;
};

export interface Spec extends TurboModule {
  setItem(value: string, key: string): void;
  getItem(key: string): string | null;
  removeItem(key: string): void;
  clear(): void;

  readonly onKeyAdded: CodegenTypes.EventEmitter<KeyValuePair>;
}

export default TurboModuleRegistry.getEnforcing<Spec>("LocalStorage");
