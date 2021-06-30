-- Alliance races
insert into race_dict(name, side)
values ("Human", 1);
insert into race_dict(name, side)
values ("Dwarf", 1);
insert into race_dict(name, side)
values ("Night Elf", 1);
insert into race_dict(name, side)
values ("Gnome", 1);
insert into race_dict(name, side)
values ("Dranei", 1);
insert into race_dict(name, side)
values ("Worgen", 1);
insert into race_dict(name, side)
values ("Pandaren", 1);
insert into race_dict(name, side)
values ("Void Elf", 1);
insert into race_dict(name, side)
values ("Lightforged Dranei", 1);
insert into race_dict(name, side)
values ("Dark Iron Dwarf", 1);
insert into race_dict(name, side)
values ("Kul Tiran", 1);
insert into race_dict(name, side)
values ("Mechagnome", 1);
-- Horde races
insert into race_dict(name, side)
values ("Tauren", 2);
insert into race_dict(name, side)
values ("Orc", 2);
insert into race_dict(name, side)
values ("Undead", 2);
insert into race_dict(name, side)
values ("Troll", 2);
insert into race_dict(name, side)
values ("Blood Elf", 2);
insert into race_dict(name, side)
values ("Goblin", 2);
insert into race_dict(name, side)
values ("Pandaren", 2);
insert into race_dict(name, side)
values ("Nightborne", 2);
insert into race_dict(name, side)
values ("Highmountain Tauren", 2);
insert into race_dict(name, side)
values ("Mag'har Orc", 2);
insert into race_dict(name, side)
values ("Zandalari Troll", 2);
insert into race_dict(name, side)
values ("Vulpera", 2);
-- Classes
insert into class_dict(name)
values ("Warrior");
insert into class_dict(name)
values ("Paladin");
insert into class_dict(name)
values ("Hunter");
insert into class_dict(name)
values ("Rogue");
insert into class_dict(name)
values ("Priest");
insert into class_dict(name)
values ("Shaman");
insert into class_dict(name)
values ("Mage");
insert into class_dict(name)
values ("Warlock");
insert into class_dict(name)
values ("Monk");
insert into class_dict(name)
values ("Druid");
insert into class_dict(name)
values ("Demon Hunter");
insert into class_dict(name)
values ("Death Knight");
-- Specs 
insert into spec_dict(name, class_id)
values ("Arms", 1);
insert into spec_dict(name, class_id)
values ("Fury", 1);
insert into spec_dict(name, class_id)
values ("Protection", 1);
insert into spec_dict(name, class_id)
values ("Holy", 2);
insert into spec_dict(name, class_id)
values ("Retribution", 2);
insert into spec_dict(name, class_id)
values ("Protection", 2);
insert into spec_dict(name, class_id)
values ("Marksmanship", 3);
insert into spec_dict(name, class_id)
values ("Beast Mastery", 3);
insert into spec_dict(name, class_id)
values ("Survival", 3);
insert into spec_dict(name, class_id)
values ("Assasination", 4);
insert into spec_dict(name, class_id)
values ("Subtlety", 4);
insert into spec_dict(name, class_id)
values ("Outlaw", 4);
insert into spec_dict(name, class_id)
values ("Shadow", 5);
insert into spec_dict(name, class_id)
values ("Holy", 5);
insert into spec_dict(name, class_id)
values ("Discipline", 5);
insert into spec_dict(name, class_id)
values ("Elemental", 6);
insert into spec_dict(name, class_id)
values ("Enhancement", 6);
insert into spec_dict(name, class_id)
values ("Restoration", 6);
insert into spec_dict(name, class_id)
values ("Arcane", 7);
insert into spec_dict(name, class_id)
values ("Frost", 7);
insert into spec_dict(name, class_id)
values ("Fire", 7);
insert into spec_dict(name, class_id)
values ("Destruction", 8);
insert into spec_dict(name, class_id)
values ("Afflicion", 8);
insert into spec_dict(name, class_id)
values ("Demonology", 8);
insert into spec_dict(name, class_id)
values ("Windwalker", 9);
insert into spec_dict(name, class_id)
values ("Mistweaver", 9);
insert into spec_dict(name, class_id)
values ("Brewmaster", 9);
insert into spec_dict(name, class_id)
values ("Balance", 10);
insert into spec_dict(name, class_id)
values ("Guardian", 10);
insert into spec_dict(name, class_id)
values ("Feral", 10);
insert into spec_dict(name, class_id)
values ("Restoration", 10);
insert into spec_dict(name, class_id)
values ("Havoc", 11);
insert into spec_dict(name, class_id)
values ("Vengeance", 11);
insert into spec_dict(name, class_id)
values ("Frost", 12);
insert into spec_dict(name, class_id)
values ("Blood", 12);
insert into spec_dict(name, class_id)
values ("Unholy", 12);
-- Class Race
-- Death Knight
insert into race_class_dict(class_id, race_id)
values(12, 1);
insert into race_class_dict(class_id, race_id)
values(12, 2);
insert into race_class_dict(class_id, race_id)
values(12, 3);
insert into race_class_dict(class_id, race_id)
values(12, 4);
insert into race_class_dict(class_id, race_id)
values(12, 5);
insert into race_class_dict(class_id, race_id)
values(12, 6);
insert into race_class_dict(class_id, race_id)
values(12, 7);
insert into race_class_dict(class_id, race_id)
values(12, 8);
insert into race_class_dict(class_id, race_id)
values(12, 9);
insert into race_class_dict(class_id, race_id)
values(12, 10);
insert into race_class_dict(class_id, race_id)
values(12, 11);
insert into race_class_dict(class_id, race_id)
values(12, 12);
insert into race_class_dict(class_id, race_id)
values(12, 13);
insert into race_class_dict(class_id, race_id)
values(12, 14);
insert into race_class_dict(class_id, race_id)
values(12, 15);
insert into race_class_dict(class_id, race_id)
values(12, 16);
insert into race_class_dict(class_id, race_id)
values(12, 17);
insert into race_class_dict(class_id, race_id)
values(12, 18);
insert into race_class_dict(class_id, race_id)
values(12, 19);
insert into race_class_dict(class_id, race_id)
values(12, 20);
insert into race_class_dict(class_id, race_id)
values(12, 21);
insert into race_class_dict(class_id, race_id)
values(12, 22);
insert into race_class_dict(class_id, race_id)
values(12, 23);
insert into race_class_dict(class_id, race_id)
values(12, 24);
-- Warrior
insert into race_class_dict(class_id, race_id)
values(1, 1);
insert into race_class_dict(class_id, race_id)
values(1, 2);
insert into race_class_dict(class_id, race_id)
values(1, 3);
insert into race_class_dict(class_id, race_id)
values(1, 4);
insert into race_class_dict(class_id, race_id)
values(1, 5);
insert into race_class_dict(class_id, race_id)
values(1, 6);
insert into race_class_dict(class_id, race_id)
values(1, 7);
insert into race_class_dict(class_id, race_id)
values(1, 8);
insert into race_class_dict(class_id, race_id)
values(1, 9);
insert into race_class_dict(class_id, race_id)
values(1, 10);
insert into race_class_dict(class_id, race_id)
values(1, 11);
insert into race_class_dict(class_id, race_id)
values(1, 12);
insert into race_class_dict(class_id, race_id)
values(1, 13);
insert into race_class_dict(class_id, race_id)
values(1, 14);
insert into race_class_dict(class_id, race_id)
values(1, 15);
insert into race_class_dict(class_id, race_id)
values(1, 16);
insert into race_class_dict(class_id, race_id)
values(1, 17);
insert into race_class_dict(class_id, race_id)
values(1, 18);
insert into race_class_dict(class_id, race_id)
values(1, 19);
insert into race_class_dict(class_id, race_id)
values(1, 20);
insert into race_class_dict(class_id, race_id)
values(1, 21);
insert into race_class_dict(class_id, race_id)
values(1, 22);
insert into race_class_dict(class_id, race_id)
values(1, 23);
insert into race_class_dict(class_id, race_id)
values(1, 24);
-- Paladin
insert into race_class_dict(class_id, race_id)
values(2, 17);
insert into race_class_dict(class_id, race_id)
values(2, 10);
insert into race_class_dict(class_id, race_id)
values(2, 5);
insert into race_class_dict(class_id, race_id)
values(2, 2);
insert into race_class_dict(class_id, race_id)
values(2, 1);
insert into race_class_dict(class_id, race_id)
values(2, 9);
insert into race_class_dict(class_id, race_id)
values(2, 13);
insert into race_class_dict(class_id, race_id)
values(2, 23);
-- Hunter
insert into race_class_dict(class_id, race_id)
values(3, 1);
insert into race_class_dict(class_id, race_id)
values(3, 2);
insert into race_class_dict(class_id, race_id)
values(3, 3);
insert into race_class_dict(class_id, race_id)
values(3, 4);
insert into race_class_dict(class_id, race_id)
values(3, 5);
insert into race_class_dict(class_id, race_id)
values(3, 6);
insert into race_class_dict(class_id, race_id)
values(3, 7);
insert into race_class_dict(class_id, race_id)
values(3, 8);
insert into race_class_dict(class_id, race_id)
values(3, 9);
insert into race_class_dict(class_id, race_id)
values(3, 10);
insert into race_class_dict(class_id, race_id)
values(3, 11);
insert into race_class_dict(class_id, race_id)
values(3, 12);
insert into race_class_dict(class_id, race_id)
values(3, 13);
insert into race_class_dict(class_id, race_id)
values(3, 14);
insert into race_class_dict(class_id, race_id)
values(3, 15);
insert into race_class_dict(class_id, race_id)
values(3, 16);
insert into race_class_dict(class_id, race_id)
values(3, 17);
insert into race_class_dict(class_id, race_id)
values(3, 18);
insert into race_class_dict(class_id, race_id)
values(3, 19);
insert into race_class_dict(class_id, race_id)
values(3, 20);
insert into race_class_dict(class_id, race_id)
values(3, 21);
insert into race_class_dict(class_id, race_id)
values(3, 22);
insert into race_class_dict(class_id, race_id)
values(3, 23);
insert into race_class_dict(class_id, race_id)
values(3, 24);
-- Rogue
insert into race_class_dict(class_id, race_id)
values(4, 1);
insert into race_class_dict(class_id, race_id)
values(4, 2);
insert into race_class_dict(class_id, race_id)
values(4, 3);
insert into race_class_dict(class_id, race_id)
values(4, 4);
insert into race_class_dict(class_id, race_id)
values(4, 6);
insert into race_class_dict(class_id, race_id)
values(4, 7);
insert into race_class_dict(class_id, race_id)
values(4, 8);
insert into race_class_dict(class_id, race_id)
values(4, 10);
insert into race_class_dict(class_id, race_id)
values(4, 11);
insert into race_class_dict(class_id, race_id)
values(4, 12);
insert into race_class_dict(class_id, race_id)
values(4, 14);
insert into race_class_dict(class_id, race_id)
values(4, 15);
insert into race_class_dict(class_id, race_id)
values(4, 16);
insert into race_class_dict(class_id, race_id)
values(4, 17);
insert into race_class_dict(class_id, race_id)
values(4, 18);
insert into race_class_dict(class_id, race_id)
values(4, 19);
insert into race_class_dict(class_id, race_id)
values(4, 20);
insert into race_class_dict(class_id, race_id)
values(4, 22);
insert into race_class_dict(class_id, race_id)
values(4, 23);
insert into race_class_dict(class_id, race_id)
values(4, 24);
-- Priest 
insert into race_class_dict(class_id, race_id)
values(5, 1);
insert into race_class_dict(class_id, race_id)
values(5, 2);
insert into race_class_dict(class_id, race_id)
values(5, 3);
insert into race_class_dict(class_id, race_id)
values(5, 4);
insert into race_class_dict(class_id, race_id)
values(5, 5);
insert into race_class_dict(class_id, race_id)
values(5, 6);
insert into race_class_dict(class_id, race_id)
values(5, 7);
insert into race_class_dict(class_id, race_id)
values(5, 8);
insert into race_class_dict(class_id, race_id)
values(5, 9);
insert into race_class_dict(class_id, race_id)
values(5, 10);
insert into race_class_dict(class_id, race_id)
values(5, 11);
insert into race_class_dict(class_id, race_id)
values(5, 12);
insert into race_class_dict(class_id, race_id)
values(5, 13);
insert into race_class_dict(class_id, race_id)
values(5, 15);
insert into race_class_dict(class_id, race_id)
values(5, 16);
insert into race_class_dict(class_id, race_id)
values(5, 17);
insert into race_class_dict(class_id, race_id)
values(5, 18);
insert into race_class_dict(class_id, race_id)
values(5, 19);
insert into race_class_dict(class_id, race_id)
values(5, 20);
insert into race_class_dict(class_id, race_id)
values(5, 22);
insert into race_class_dict(class_id, race_id)
values(5, 23);
insert into race_class_dict(class_id, race_id)
values(5, 24);
-- Shaman
insert into race_class_dict(class_id, race_id)
values(6, 2);
insert into race_class_dict(class_id, race_id)
values(6, 5);
insert into race_class_dict(class_id, race_id)
values(6, 7);
insert into race_class_dict(class_id, race_id)
values(6, 10);
insert into race_class_dict(class_id, race_id)
values(6, 11);
insert into race_class_dict(class_id, race_id)
values(6, 13);
insert into race_class_dict(class_id, race_id)
values(6, 16);
insert into race_class_dict(class_id, race_id)
values(6, 18);
insert into race_class_dict(class_id, race_id)
values(6, 19);
insert into race_class_dict(class_id, race_id)
values(6, 22);
insert into race_class_dict(class_id, race_id)
values(6, 23);
insert into race_class_dict(class_id, race_id)
values(6, 24);
-- Mage
insert into race_class_dict(class_id, race_id)
values(7, 1);
insert into race_class_dict(class_id, race_id)
values(7, 2);
insert into race_class_dict(class_id, race_id)
values(7, 3);
insert into race_class_dict(class_id, race_id)
values(7, 4);
insert into race_class_dict(class_id, race_id)
values(7, 5);
insert into race_class_dict(class_id, race_id)
values(7, 6);
insert into race_class_dict(class_id, race_id)
values(7, 7);
insert into race_class_dict(class_id, race_id)
values(7, 8);
insert into race_class_dict(class_id, race_id)
values(7, 9);
insert into race_class_dict(class_id, race_id)
values(7, 10);
insert into race_class_dict(class_id, race_id)
values(7, 11);
insert into race_class_dict(class_id, race_id)
values(7, 12);
insert into race_class_dict(class_id, race_id)
values(7, 14);
insert into race_class_dict(class_id, race_id)
values(7, 15);
insert into race_class_dict(class_id, race_id)
values(7, 16);
insert into race_class_dict(class_id, race_id)
values(7, 17);
insert into race_class_dict(class_id, race_id)
values(7, 18);
insert into race_class_dict(class_id, race_id)
values(7, 19);
insert into race_class_dict(class_id, race_id)
values(7, 20);
insert into race_class_dict(class_id, race_id)
values(7, 22);
insert into race_class_dict(class_id, race_id)
values(7, 23);
insert into race_class_dict(class_id, race_id)
values(7, 24);
-- Warlock
insert into race_class_dict(class_id, race_id)
values(8, 1);
insert into race_class_dict(class_id, race_id)
values(8, 2);
insert into race_class_dict(class_id, race_id)
values(8, 3);
insert into race_class_dict(class_id, race_id)
values(8, 4);
insert into race_class_dict(class_id, race_id)
values(8, 6);
insert into race_class_dict(class_id, race_id)
values(8, 8);
insert into race_class_dict(class_id, race_id)
values(8, 10);
insert into race_class_dict(class_id, race_id)
values(8, 14);
insert into race_class_dict(class_id, race_id)
values(8, 15);
insert into race_class_dict(class_id, race_id)
values(8, 16);
insert into race_class_dict(class_id, race_id)
values(8, 17);
insert into race_class_dict(class_id, race_id)
values(8, 18);
insert into race_class_dict(class_id, race_id)
values(8, 20);
insert into race_class_dict(class_id, race_id)
values(8, 24);
-- Monk
insert into race_class_dict(class_id, race_id)
values(9, 1);
insert into race_class_dict(class_id, race_id)
values(9, 2);
insert into race_class_dict(class_id, race_id)
values(9, 3);
insert into race_class_dict(class_id, race_id)
values(9, 4);
insert into race_class_dict(class_id, race_id)
values(9, 5);
insert into race_class_dict(class_id, race_id)
values(9, 6);
insert into race_class_dict(class_id, race_id)
values(9, 7);
insert into race_class_dict(class_id, race_id)
values(9, 8);
insert into race_class_dict(class_id, race_id)
values(9, 9);
insert into race_class_dict(class_id, race_id)
values(9, 10);
insert into race_class_dict(class_id, race_id)
values(9, 11);
insert into race_class_dict(class_id, race_id)
values(9, 12);
insert into race_class_dict(class_id, race_id)
values(9, 13);
insert into race_class_dict(class_id, race_id)
values(9, 14);
insert into race_class_dict(class_id, race_id)
values(9, 15);
insert into race_class_dict(class_id, race_id)
values(9, 16);
insert into race_class_dict(class_id, race_id)
values(9, 17);
insert into race_class_dict(class_id, race_id)
values(9, 18);
insert into race_class_dict(class_id, race_id)
values(9, 19);
insert into race_class_dict(class_id, race_id)
values(9, 20);
insert into race_class_dict(class_id, race_id)
values(9, 21);
insert into race_class_dict(class_id, race_id)
values(9, 22);
insert into race_class_dict(class_id, race_id)
values(9, 23);
insert into race_class_dict(class_id, race_id)
values(9, 24);
-- Druid
insert into race_class_dict(class_id, race_id)
values(10, 3);
insert into race_class_dict(class_id, race_id)
values(10, 6);
insert into race_class_dict(class_id, race_id)
values(10, 11);
insert into race_class_dict(class_id, race_id)
values(10, 13);
insert into race_class_dict(class_id, race_id)
values(10, 16);
insert into race_class_dict(class_id, race_id)
values(10, 21);
insert into race_class_dict(class_id, race_id)
values(10, 23);
-- Demon Hunter
insert into race_class_dict(class_id, race_id)
values(11, 3);
insert into race_class_dict(class_id, race_id)
values(11, 17);