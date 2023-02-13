import { Denops } from "https://deno.land/x/denops_std@v3.12.1/mod.ts";
import { main as DdcMain } from "./plugins/ddc.ts";
import { main as DduMain } from "./plugins/ddu.ts";

export function main(denops: Denops) {
  denops.dispatcher = {
    echo(arg1: unknown): Promise<void> {
      console.log(arg1);
      return Promise.resolve();
    },
  };

  DdcMain(denops);
  DduMain(denops);
}
