package com.gregtechceu.gtceu.common.machine.electric;

import com.gregtechceu.gtceu.api.machine.IMachineBlockEntity;
import com.gregtechceu.gtceu.api.machine.SimpleTieredMachine;
import com.gregtechceu.gtceu.common.data.GTMachines;

public class RockCrusherMachine extends SimpleTieredMachine {

    public RockCrusherMachine(IMachineBlockEntity holder, int tier) {
        super(holder, tier, GTMachines.defaultTankSizeFunction);
    }

    @Override
    public boolean shouldWeatherOrTerrainExplosion() {
        return false;
    }
}
