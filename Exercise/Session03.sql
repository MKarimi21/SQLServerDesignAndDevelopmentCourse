/*
	A: {1, 2, 3, 4}
	B: {1, 1, 1, 2, 2, 3, 4, 4, 4}
	amalan in 2 baham barabaran chon tekrar tasiry nadareh va hardoo
	1 ta 4 daran

	UNION -> ejtemaa ama agar benevisim ye bar add tekrari mineviseh
	UNION ALL -> ejtemah ama tekrari ham mineviseh
	EXCEPT (Minus) -> tafrigh ya be joz
	INTERSECT -> eshterak
*/

-- A: {1}
SELECT 1;
GO;

-- A: {(1, 2)}
SELECT 1, 2;
GO;

-- A U B -> {1, 2, 3, 4}
SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 4;
GO;

-- A U(ALL) B -> {1, 2, 3, 4, 4}
SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 4;
GO;

-- A {1, 2, 3} ^ B {1, 2} -> {1 , 2}
(SELECT 1 UNION SELECT 2 UNION SELECT 3)
INTERSECT
(SELECT 1 UNION SELECT 2);
GO;

-- A {1, 2, 3} - B {1, 2} -> {3}
(SELECT 1 UNION SELECT 2 UNION SELECT 3)
EXCEPT
(SELECT 1 UNION SELECT 2);
GO;

