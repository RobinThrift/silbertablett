import { IConfig } from './types'
import cpy from 'cpy'
import { join } from 'path'

const DEFAULT_BLACKLIST: string[] = ['!.DS_Store']

export async function assets(config: IConfig): Promise<void> {
    return cpy(
        [join(config.srcDir, 'assets', '**'), ...DEFAULT_BLACKLIST],
        join(config.targetDir, 'assets')
    )
}
