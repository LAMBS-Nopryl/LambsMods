# LAMBS Medical
## Description
Lambs medical is a mod that latches on top ACE advanced medical and changes some item stats and behavior of it.
Most notable are the changes to the medical menu.

## Bandages
All bandage stats have been altered to be uniform to each other. Meaning all bandages will heal the same amount and all have no chance of wound reopening.

Currently the healing stat is set to "4".

Bandages now also heal crippling on limbs (limb hitpoint damage). If a patient has limb damage but does not have any open wounds (bleeding) you still get the option in the medical menu to heal their limbs. Meaning no medic is required to heal this with a PAK anymore.

## Blood IVs
Blood IVs have changed stats now, applying a blood IV now takes 3 instead of 7 seconds.

All blood IVs have now double their volume, meaning a 500 ml bag is now a 1000 ml one and a 1000 ml is now a 2000 ml one.

## PAK
The PAK stays the same, except its weight has been increased.

## Epinephrine
Epinephrine has been changed to get unconscious people up faster for gameplay purposes.

If the CBA setting is enabled and an epipen is used on an unconscious patient all needed states, such as blood volume, blood pressure, heartrate and pain levels will be if needed adjusted to wake that patient up.

Meaning, a patient that has no sufficient heartrate, too much pain, no blood pressure and no blood will have just barely enough to wake up and keep running, but the next bullet will send them back down again.

The magic epipen will only work if the patient is stable, meaning they are unconscious, not bleeding, and all wounds are healed. If one of these conditions are not met, it will be a normal epipen.

## Medical Menu
The medical menu has changed the most. It is not required anymore to select any body part in the middle of the menu, next to all actions are now independent and do not need a body part to be selected.

Bandage and tourniquet actions will now only appear if there is an open wound. All bandage actions are now tied to a body part, meaning there will be a button for each body part.
Tourniquet actions are all bundled into "Smart Tourniquet" and "Remove Tourniquet". These actions are made due to a limit in the medical menu itself. "Smart Tourniquet" will apply a tourniquet on the most bleeding limb, where as "Remove Tourniquet" will remove a tourniquet from the least bleeding limb.
Example:
The patients head and right arm are bleeding. The bandage category will now show "Smart Tourniquet", "Bandage Head" and "Bandage Right Arm".
Upon using the "Smart Tourniquet" action, a "Remove Tourniquet" action will appear at the very bottom.

This is done to go with normal medical procedures and the actions can be worked from the top to bottom.
1. Tourniquet the patient
2. Bandage the patients head and torso first
3. Bandage the limbs
4. Take of tourniquets
