package com.gregtechceu.gtceu.api.graphnet.pipenet.predicate;

import com.gregtechceu.gtceu.api.graphnet.predicate.EdgePredicate;
import com.gregtechceu.gtceu.api.graphnet.predicate.test.IPredicateTestObject;

import com.gregtechceu.gtceu.common.cover.filter.BaseFilterContainer;
import net.minecraft.nbt.CompoundTag;

import net.minecraft.world.item.ItemStack;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import java.util.Objects;

public final class FilterPredicate extends EdgePredicate<FilterPredicate, CompoundTag> {

    public static final FilterPredicate INSTANCE = new FilterPredicate();

    private @Nullable BaseFilterContainer sourceFilter;
    private @Nullable BaseFilterContainer targetFilter;

    private FilterPredicate() {
        super("FluidFilter");
    }

    public void setSourceFilter(@Nullable BaseFilterContainer sourceFilter) {
        this.sourceFilter = sourceFilter;
    }

    public void setTargetFilter(@Nullable BaseFilterContainer targetFilter) {
        this.targetFilter = targetFilter;
    }

    @Override
    public CompoundTag serializeNBT() {
        CompoundTag tag = new CompoundTag();
        if (sourceFilter != null) tag.put("Source", sourceFilter.serializeNBT());
        if (targetFilter != null) tag.put("Target", targetFilter.serializeNBT());
        return tag;
    }

    @Override
    public void deserializeNBT(CompoundTag nbt) {
        if (nbt.contains("Source")) {
            sourceFilter = new GenericFilterContainer();
            sourceFilter.deserializeNBT(nbt.getCompound("Source"));
        } else sourceFilter = null;
        if (nbt.contains("Target")) {
            targetFilter = new GenericFilterContainer();
            targetFilter.deserializeNBT(nbt.getCompound("Target"));
        } else targetFilter = null;
    }

    @Override
    public boolean andy() {
        return true;
    }

    @Override
    public @NotNull FilterPredicate getNew() {
        return new FilterPredicate();
    }

    @Override
    public boolean test(IPredicateTestObject object) {
        Object test = object.recombine();
        if (sourceFilter != null && !sourceFilter.test(test)) return false;
        return targetFilter == null || targetFilter.test(test);
    }

    private static class GenericFilterContainer extends BaseFilterContainer {

        protected GenericFilterContainer() {
            super(() -> {});
        }

        @Override
        protected boolean isItemValid(ItemStack stack) {
            return true;
        }

        @Override
        protected String getFilterName() {
            return "";
        }
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        FilterPredicate predicate = (FilterPredicate) o;
        return Objects.equals(sourceFilter, predicate.sourceFilter) &&
                Objects.equals(targetFilter, predicate.targetFilter);
    }

    @Override
    public int hashCode() {
        return Objects.hash(sourceFilter, targetFilter);
    }
}
