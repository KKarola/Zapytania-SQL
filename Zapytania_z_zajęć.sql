--------------------------------------------------------------------------------------------------------------------------------
-- CZÊŒÆ I

-- Zadanie 1
-- Wypisz numery departamentów, nazwiska pracowników oraz numery pracownicze ich szefów z tabeli EMP.
SELECT deptno, ename, mgr
From EMP;

-- Zadanie 2
-- Wypisz wszystkie wartoœci wszystkich kolumn z tabeli EMP.
SELECT *
FROM EMP;

-- Zadanie 3
-- Wylicz wartoœæ rocznej pensji podstawowej (12 p³ac miesiêcznych) dla ka¿dego pracownika.
SELECT ename, 12*SAL
FROM EMP;

-- Zadanie 4
-- Wypisz nazwisko i wartoœci rocznej pensje podstawowej ka¿dego pracownika, jeœli ka¿dy dostanie podwy¿kê o 250.
SELECT ename, 12*(SAL+250)
FROM EMP;

-- Zadanie 5
-- Wypisz nazwisko i wartoœci rocznej pensji podstawowej ka¿dego pracownika. Wynikow¹ kolumnê nazwij (zaetykietuj) 
-- nag³ówkiem Roczna.
SELECT ename || ' ' || 12*SAL Roczna
FROM EMP;

-- Zadanie 6
-- Kolumnê zawieraj¹c¹ wyniki operacji sal * 12 opatrz nag³ówkiem P³aca Roczna.
SELECT ename, 12*sal "Placa Roczna"
FROM EMP;

-- Zadanie 7
-- Wypisz w jednej kolumnie po³¹czone (skonkatenowane) numery i nazwiska pracowników. Kolumnê wynikow¹ zaetykietuj 
-- nag³ówkiem Zatrudniony.
SELECT empno || ' ' || ename "Zatrudniony"
FROM EMP;

-- Zadanie 8
-- Utwórz zapytanie zwracaj¹ce tekst: „Pracownik numer i nazwisko pracownika pracuje w dziale nr numer dzia³u i zarabia p³aca” 
-- z nag³ówkiem Dane pracownika.
SELECT 'Pracownik ' || empno || ': ' || ename || ' pracuje w dziale numer ' || deptno || ' i zarabia '|| sal "Dane pracownika"
FROM EMP;

-- Zadanie 9
-- Dla ka¿dego pracownika wypisz jego nazwisko i ca³kowite roczne dochody (z uwzglêdnieniem prowizji, 
-- czyli 12 p³ac miesiêcznych + prowizja).
SELECT ename, 12*sal + NVL(comm, 0)
FROM EMP;

-- Zadanie 10
-- Wypisz wszystkie numery departamentów wystêpuj¹ce w tabeli EMP.
SELECT deptno
FROM EMP;

-- Zadanie 11
-- Wypisz wszystkie ró¿ne numery departamentów wystêpuj¹ce w tabeli EMP.
SELECT DISTINCT deptno
FROM EMP;

-- Zadanie 12
-- Wypisz wszystkie wzajemnie ró¿ne kombinacje wartoœci deptno i job.
SELECT DISTINCT deptno, job
FROM EMP;

-- Zadanie 13
-- Posortuj rosn¹co wszystkie dane tabeli EMP wed³ug wartoœci kolumny ename.
SELECT *
FROM EMP
ORDER BY ename;

-- Zadanie 14
-- Posortuj malej¹co wszystkie dane tabeli EMP wed³ug daty zatrudnienia (hiredate), pocz¹wszy od ostatnio zatrudnionych.
SELECT *
FROM EMP
ORDER BY hiredate DESC;

-- Zadanie 15
-- Posortuj dane tabeli EMP wed³ug wzrastaj¹cej wartoœci kolumny deptno, oraz malej¹cych wartoœci kolumny sal
SELECT *
FROM EMP
ORDER BY deptno ASC, sal DESC;


--------------------------------------------------------------------------------------------------------------------------------
-- CZÊŒÆ II

-- Zadanie 1
-- Wypisz nazwiska, numery pracowników, stanowiska pracy, p³acê i numery departamentów wszystkich zatrudnionych 
-- na stanowisku CLERK.
SELECT ename, empno, job, sal, deptno
FROM EMP
WHERE job='CLERK';

-- Zadanie 2
-- Wypisz wszystkie nazwy i numery departamentów wiêksze od 20.
SELECT deptno, dname
FROM DEPT
WHERE deptno > 20;

-- Zadanie 3
-- Wypisz nazwiska pracowników, których prowizja przekracza miesiêczn¹ pensjê.
SELECT ename
FROM EMP
WHERE sal < comm;

-- Zadanie 4
-- ZnajdŸ wszystkie dane tych pracowników, których zarobki mieszcz¹ siê w przedziale pomiêdzy 1000 a 2000.
SELECT ename, sal
FROM EMP
WHERE sal between 1000 and 2000;

-- Zadanie 5
-- ZnajdŸ nazwiska i numery pracowników, których bezpoœrednimi szefami s¹ 7902, 7566 lub 7788.
SELECT ename, empno, mgr
FROM EMP
WHERE mgr in(7902,7566,7788);

-- Zadanie 6
-- ZnajdŸ nazwiska pracowników zaczynaj¹ce siê na literê S.
SELECT ename
FROM EMP
WHERE ename like 'S%';

-- Zadanie 7
-- ZnajdŸ czteroliterowe nazwiska pracowników.
SELECT ename
FROM EMP
WHERE ename like '____';

-- Zadanie 8
-- ZnajdŸ wszystkie dane pracowników, którzy nie posiadaj¹ szefa.
SELECT *
FROM EMP
WHERE mgr is null;

-- Zadanie 9
-- ZnajdŸ dane tych pracowników, których zarobki s¹ poza przedzia³em <1000, 2000>.
SELECT *
FROM EMP
WHERE sal not between 1000 AND 2000;

-- Zadanie 10
-- ZnajdŸ nazwiska pracowników zaczynaj¹ce siê na literê M.
SELECT ename
FROM EMP
WHERE ename not like 'M%';

-- Zadanie 11
-- ZnajdŸ dane tych pracowników, którzy maj¹ szefa.
SELECT *
FROM EMP
WHERE mgr is not null;

-- Zadanie 12
-- ZnajdŸ dane tych pracowników zatrudnionych na stanowisku CLERK, których zarobki mieszcz¹ siê w przedziale <1000, 2000>.
SELECT *
FROM EMP
WHERE job='CLERK' AND sal between 1000 AND 2000;

-- Zadanie 13
-- ZnajdŸ dane tych pracowników, którzy s¹ zatrudnieni na stanowisku CLERK, lub ich zarobki 
-- mieszcz¹ siê w przedziale <1000, 2000>.
SELECT *
FROM EMP
WHERE job='CLERK' OR sal between 1000 AND 2000;

-- Zadanie 14
-- ZnajdŸ wszystkich pracowników zatrudnionych na stanowisku MANAGER z pensj¹ powy¿ej 1500, oraz wszystkich 
-- na stanowisku SALESMAN.
SELECT *
FROM EMP
WHERE job='MANAGER' AND sal>1500 OR job='SALESMAN';

-- Zadanie 15
-- ZnajdŸ wszystkich pracowników zatrudnionych na stanowisku MANAGER, lub na stanowisku SALESMAN z pensj¹ powy¿ej 1500.
SELECT *
FROM EMP
WHERE (job='MANAGER' OR job='SALESMAN') AND sal>1500;

-- Zadanie 16
-- ZnajdŸ wszystkich pracowników zatrudnionych na stanowisku MANAGER ze wszystkich departamentów, wraz ze wszystkimi 
-- pracownikami zatrudnionymi na stanowisku CLERK w departamencie 10.
SELECT *
FROM EMP
WHERE job='MANAGER' OR job='CLERK' AND deptno='10'; 

-- Zadanie 17
-- Wypisz wszystkie dane z tabeli SALGRADE.
SELECT *
FROM SALGRADE;

-- Zadanie 18
-- Wypisz wszystkie dane z tabeli DEPT.
SELECT *
FROM DEPT;

-- Zadanie 19
-- ZnajdŸ dane tych pracowników zatrudnionych na stanowisku CLERK, których zarobki nie mieszcz¹ siê w przedziale <1000, 2000>.
SELECT *
FROM EMP
WHERE sal not between 1000 and 2000;

-- Zadanie 20
-- Wypisz numery i nazwy departamentów, sortuj¹c wynikowe rekordy rosn¹co wed³ug numerów departamentów.
SELECT deptno, dname
FROM DEPT
ORDER BY deptno ASC;

-- Zadanie 21
-- Wypisz wszystkie wzajemnie ró¿ne (niepowtarzaj¹ce siê) stanowiska pracy.
SELECT DISTINCT job
FROM EMP;

-- Zadanie 22
-- Wypisz nazwiska, stanowiska i numery departamentów pracowników zatrudnionych 
-- w departamentach 10 i 20 w kolejnoœci alfabetycznej nazwisk pracowników.
SELECT ename, job, deptno
FROM EMP
WHERE deptno in (10,20)
ORDER BY ename;

-- Zadanie 23
-- Wypisz nazwiska, stanowiska i numery departamentów wszystkich pracowników z departamentu 20 zatrudnionych 
-- na stanowisku CLERK.
SELECT ename, job, deptno
FROM EMP
WHERE deptno='20' AND job='CLERK';

-- Zadanie 24
-- Wypisz nazwiska, w których wystêpuje ci¹g liter „TH” lub „LL”.
SELECT ename
FROM EMP
WHERE ename like '%TH%' OR ename like '%LL%';

-- Zadanie 25
-- Wypisz nazwisko, stanowisko i pensjê pracowników, którzy posiadaj¹ szefa.
SELECT ename, job, sal
FROM EMP
WHERE mgr is not null;

-- Zadanie 26
-- Dla ka¿dego pracownika wypisz jego nazwisko i ca³oroczne dochody.
SELECT ename, 12*sal+nvl(comm,0) Roczne_dochody
FROM EMP;

-- Zadanie 27
-- Wypisz numer departamentu i datê zatrudnienia pracowników, którzy zostali zatrudnieni w 1982 r.
SELECT ename, deptno, hiredate
FROM EMP
WHERE HIREDATE like '82%'; 

-- Zadanie 28
-- Wypisz nazwiska, roczn¹ pensjê oraz prowizjê tych wszystkich SALESMAN’ów, których miesiêczna pensja przekracza prowizjê. 
-- Wyniki posortuj wed³ug malej¹cych zarobków, potem nazwisk (rosn¹co).
SELECT ename, 12*sal Roczna_pensja, comm
FROM EMP
WHERE job='SALESMAN' AND sal>comm
ORDER BY sal DESC, ename ASC;


--------------------------------------------------------------------------------------------------------------------------------
-- CZÊŒÆ III

-- Zadanie 1
-- Wypisz wszystkie dane z tabel EMP i DEPT.
SELECT *
FROM EMP e, DEPT d
WHERE e.deptno=d.deptno;

-- Zadanie 2
-- Wybierz nazwiska wszystkich pracowników, oraz nazwy departamentów w których s¹ zatrudnieni. Zwracane rekordy posortuj 
-- w kolejnoœci alfabetycznej nazwisk.
SELECT ename, dname
FROM EMP e
INNER JOIN DEPT d
ON e.deptno=d.deptno
ORDER BY ename;

-- Zadanie 3
-- Wybierz nazwiska wszystkich pracowników, wraz z numerami, nazwami i lokalizacjami departamentów, 
-- w których s¹ oni zatrudnieni.
SELECT e.ename, d.deptno, d.dname, d.loc
FROM EMP e
INNER JOIN DEPT d
ON e.deptno=d.deptno;

-- Zadanie 4
-- Dla pracowników o miesiêcznej pensji powy¿ej 1500 podaj ich nazwiska, miejsca usytuowania ich departamentów, 
-- oraz nazwy tych departamentów.
SELECT e.ename, d.deptno, d.dname, d.loc, e.sal
FROM EMP e
INNER JOIN DEPT d
ON e.deptno=d.deptno
WHERE sal>1500;

-- Zadanie 5
-- Utwórz listê pracowników podaj¹c ich nazwisko, zawód, pensjê i stopieñ zaszeregowania (grupê zarobkow¹).
SELECT e.ename, e.job, e.sal, s.grade
FROM EMP e
INNER JOIN SALGRADE s
ON e.sal BETWEEN s.losal AND s.hisal;

-- Zadanie 6
-- Wypisz informacje o pracownikach, których zarobki odpowiadaj¹ 3 klasie zarobkowej.
SELECT e.ename, e.job, e.sal, s.grade
FROM EMP e
INNER JOIN SALGRADE s
ON e.sal BETWEEN s.losal AND s.hisal AND s.grade='3';

-- Zadanie 7
-- Wybierz pracowników zatrudnionych w DALLAS.
SELECT e.ename, d.deptno, d.dname, d.loc
FROM EMP e
INNER JOIN DEPT d
ON e.deptno=d.deptno
WHERE d.loc='DALLAS';

-- Zadanie 8
-- Wybierz pracowników z dzia³u 30 i 40 (nazwisko, nr. dzia³u, nazwa dzia³u, lokalizacja). 
-- Wypisz równie¿ dane dzia³u, 40 w którym niema pracowników.
SELECT e.ename, d.deptno, d.dname, d.loc
FROM EMP e
RIGHT OUTER JOIN DEPT d
ON e.deptno=d.deptno
WHERE d.deptno in (30,40);

-- Zadanie 9
-- Wypisz nazwisko, nazwê i lokalizacje dzia³u wszystkich pracowników. Uwzglêdnij tak¿e tych pracowników, 
-- którzy nie s¹ przypisani do ¿adnego dzia³u.
SELECT e.ename, d.deptno, d.dname, d.loc
FROM EMP e
LEFT OUTER JOIN DEPT d
ON e.deptno=d.deptno;

-- Zadanie 10
-- Wypisz nazwiska wszystkich pracowników oraz nazwy wszystkich dzia³ów. W wyniku maja pojawiæ siê nazwiska pracowników nie 
-- przypisanych do ¿adnych dzia³ów, a tak¿e nazwy dzia³ów, w których nie s¹ zatrudnieni pracownicy.
SELECT e.ename, d.deptno, d.dname, d.loc
FROM EMP e
FULL OUTER JOIN DEPT d
ON e.deptno=d.deptno;

-- Zadanie 11
-- Wypisz nazwiska pracowników, którzy zarabiaj¹ mniej od swoich kierowników.
SELECT e.ename
FROM EMP e
INNER JOIN EMP emp
ON e.mgr=emp.empno
WHERE e.sal<emp.sal;

-- Zadanie 12
-- Do rozwi¹zania zadania 11 do³¹cz nazwiska szefów, oraz p³ace szefów i ich podw³adnych.
SELECT e.ename,e.sal, emp.ename, emp.sal
FROM EMP e
INNER JOIN EMP emp
ON e.mgr=emp.empno
WHERE e.sal<emp.sal;

-- Zadanie 13
-- Wykorzystuj¹c operacjê na zbiorach wyników, wypisz stanowiska wystêpuj¹ce w dziale 10 lub w dziale 30.
SELECT job
FROM EMP 
WHERE deptno='10'

UNION

SELECT job
FROM EMP 
WHERE deptno='30';

-- Zadanie 14
-- Wykorzystuj¹c operacjê na zbiorach wyników, wypisz stanowiska wystêpuj¹ce zarówno w dziale 10, jak i w dziale 30.
SELECT job
FROM EMP 
WHERE deptno='10'

INTERSECT

SELECT job
FROM EMP 
WHERE deptno='30';

-- Zadanie 15
-- Wykorzystuj¹c operacjê na zbiorach wyników, wypisz stanowiska wystêpuj¹ce w dziale 10, a nie wystêpuj¹ce w dziale 30.
SELECT job FROM EMP WHERE deptno='10'
MINUS
SELECT job FROM EMP WHERE deptno='30';


--------------------------------------------------------------------------------------------------------------------------------
-- CZÊŒÆ IV

-- Zadanie 1
-- Oblicz œredni zarobek w firmie, nazywaj¹c wynikow¹ kolumnê Œrednia p³aca
SELECT AVG(sal) "Srednia placa"
FROM EMP;

-- Zadanie 2
-- ZnajdŸ minimalne zarobki na stanowisku CLERK.
SELECT MIN(sal)
FROM EMP
WHERE job='CLERK';

-- Zadanie 3
-- Policz pracowników zatrudnionych w departamencie 20.
SELECT COUNT(*)
FROM EMP
WHERE deptno='20';

-- Zadanie 4
-- Oblicz œrednie zarobki na ka¿dym ze stanowisk pracy.
SELECT job, AVG(sal)
FROM EMP
GROUP BY job;

-- Zadanie 5
-- Obliczy œrednie zarobki na ka¿dym ze stanowisk pracy, z wyj¹tkiem stanowiska MANAGER.
SELECT job, AVG(sal)
FROM EMP
WHERE job<>'MANAGER'
GROUP BY job;

-- Zadanie 6
-- Obliczy œrednie zarobki na ka¿dym ze stanowisk pracy w ka¿dym departamencie.
SELECT deptno, job, AVG(sal)
FROM EMP
GROUP BY deptno, job;

-- Zadanie 7
-- Oblicz maksymalne zarobki dla ka¿dego stanowiska.
SELECT job, MAX(sal)
FROM EMP
GROUP BY job;

-- Zadanie 8
-- Wybierz œrednie zarobki tych departamentów, które zatrudniaj¹ wiêcej ni¿ trzech pracowników.
SELECT deptno, AVG(sal)
FROM EMP
GROUP BY deptno
HAVING COUNT(*)>3;

-- Zadanie 9
-- Wybierz stanowiska, na których œredni zarobek wynosi 3000 lub wiêcej.
SELECT job, AVG(sal)
FROM EMP
GROUP BY job
HAVING AVG(sal)>=3000;

-- Zadanie 10
-- ZnajdŸ œrednie miesiêczne pensje oraz œrednie roczne dochody dla ka¿dego stanowiska (pamiêtaj o prowizji).
SELECT job, AVG(sal), AVG(12*sal + 12*NVL(comm,0))
FROM EMP
GROUP BY job;

-- Zadanie 11
-- ZnajdŸ departamenty zatrudniaj¹ce wiêcej ni¿ trzech pracowników.
SELECT deptno, COUNT(*)
FROM EMP
GROUP BY deptno
HAVING COUNT(*)>3;

-- Zadanie 12
-- SprawdŸ, czy wszystkie numery pracowników s¹ rzeczywiœcie wzajemnie ró¿ne.
SELECT empno
FROM EMP
GROUP BY empno
HAVING COUNT(*)>1;

-- Zadanie 13
-- Podaj najni¿sze pensje wyp³acane podw³adnym swoich kierowników. Wyeliminuj grupy o minimalnych zarobkach ni¿szych ni¿ 1000. 
-- Uporz¹dkuj wyniki malej¹co wed³ug wielkoœci pensji.
SELECT mgr, MIN(sal) 
FROM EMP
GROUP BY mgr
HAVING MIN(sal)>=1000
ORDER BY MIN(sal) DESC;

-- Zadanie 14
-- Policz, ilu pracowników ma dzia³ maj¹cy siedzibê w DALLAS.
SELECT COUNT(*)
FROM EMP e
INNER JOIN DEPT d
ON e.deptno = d.deptno
WHERE loc='DALLAS'
GROUP BY dname;

-- Zadanie 15
-- Podaj maksymalne zarobki dla ka¿dej grupy zarobkowej.
SELECT s.grade, MAX(sal)
FROM EMP e
INNER JOIN SALGRADE s
ON e.sal between s.losal AND s.hisal
Group BY s.grade;

-- Zadanie 16
-- SprawdŸ, które wartoœci zarobków powtarzaj¹ siê i ilu pracowników je otrzymuje.
SELECT sal, COUNT(*)
FROM EMP
GROUP BY sal
HAVING COUNT(*)>1;

-- Zadanie 17
-- Podaj œredni zarobek pracowników z drugiej grupy zarobkowej.
SELECT AVG(sal)
FROM EMP e
INNER JOIN SALGRADE s
ON s.grade='2' AND e.sal between s.losal AND s.hisal;

-- Zadanie 18
-- SprawdŸ, ilu podw³adnych ma ka¿dy kierownik, podaj¹c nazwisko kierownika.
SELECT mgr, COUNT(*)
FROM EMP 
GROUP BY mgr;

-- Zadanie 19
-- Podaj sumê, któr¹ zarabiaj¹ razem wszyscy pracownicy z pierwszej grupy zarobkowej.
SELECT SUM(sal)
FROM EMP e
INNER JOIN SALGRADE s
ON s.grade ='1' AND e.sal BETWEEN s.losal AND s.hisal; 


--------------------------------------------------------------------------------------------------------------------------------
-- CZÊŒÆ V

-- Zadanie 1
-- ZnajdŸ pracowników z pensj¹ równ¹ minimalnemu zarobkowi w firmie.
SELECT ename,sal
FROM EMP
WHERE sal = (SELECT MIN(sal)
                FROM EMP);

-- Zadanie 2
-- ZnajdŸ wszystkich pracowników zatrudnionych na tym samym stanowisku, co BLAKE.                
SELECT ename
FROM EMP
WHERE job = (SELECT job
                FROM EMP
                WHERE ename='BLAKE');

-- Zadanie 3
-- ZnajdŸ pracowników, których p³ace wynosz¹ tyle, ile najni¿sze zarobki w poszczególnych departamentach.                
SELECT ename
FROM EMP
WHERE sal IN (SELECT MIN(sal)
                FROM EMP
                GROUP BY deptno);

-- Zadanie 4
-- ZnajdŸ pracowników o najni¿szych zarobkach w ich departamentach.
SELECT ename, deptno
FROM EMP
WHERE (sal, deptno) IN (SELECT MIN(sal), deptno
                        FROM EMP
                        GROUP BY deptno);

-- Zadanie 5
-- Stosuj¹c kwantyfikator ANY wybierz pracowników zarabiaj¹cych powy¿ej najni¿szego zarobku z departamentu 30 
-- (czyli wiêcej od dowolnego pracownika z departamentu 30).                        
SELECT ename, deptno
FROM EMP
WHERE sal > ANY (SELECT sal
                    FROM EMP
                    WHERE deptno='30');

-- Zadanie 6
-- Stosuj¹c kwantyfikator ALL znajdŸ pracowników, których zarobki s¹ wy¿sze od pensji ka¿dego pracownika z departamentu 30 
-- (czyli wiêksze od najwy¿szej pensji w departamencie 30).                    
SELECT ename, deptno 
FROM EMP
WHERE sal > ALL (SELECT sal
                    FROM EMP
                    WHERE deptno='30');

-- Zadanie 7
-- Wybierz departamenty, których œrednie zarobki przekraczaj¹ œredni zarobek departamentu 30.                    
SELECT deptno, AVG(sal)
FROM EMP
GROUP BY deptno
HAVING AVG(sal) > (SELECT AVG(sal)
                    FROM EMP
                    WHERE deptno='30');

-- Zadanie 8
-- ZnajdŸ stanowisko, na którym s¹ najwy¿sze œrednie zarobki.                    
SELECT job, AVG(sal)
FROM EMP
GROUP BY job
HAVING AVG(sal) = (SELECT MAX(AVG(sal))
                FROM EMP
                GROUP BY job);

-- Zadanie 9
-- ZnajdŸ pracowników, których zarobki przekraczaj¹ najwy¿sze pensje z departamentu SALES.                
SELECT ename, sal
FROM EMP
WHERE sal > (SELECT MAX(sal)
                FROM EMP e
                INNER JOIN DEPT d
                ON e.deptno=d.deptno
                WHERE d.dname='SALES');

-- Zadanie 10
-- ZnajdŸ pracowników, którzy pracuj¹ na tym samym stanowisku, co pracownik o numerze 7369 i których zarobki s¹ wiêksze 
-- ni¿ pracownika o numerze 7876.                
SELECT ename
FROM EMP
WHERE job = (SELECT job
                FROM EMP
                WHERE empno='7369')                
        AND (sal + NVL(comm,0)) > (SELECT sal + NVL(comm,0)
                                    FROM EMP
                                    WHERE empno='7876');

-- Zadanie 11
-- Wypisz nazwy dzia³ów w których pracuj¹ urzêdnicy (CLERK).                                    
SELECT DISTINCT dname
FROM EMP e
INNER JOIN DEPT d
ON e.deptno=d.deptno
WHERE job='CLERK';


--------------------------------------------------------------------------------------------------------------------------------
-- CZÊŒÆ VI

-- Zadanie 1
-- ZnajdŸ pracowników, którzy zarabiaj¹ najwiêcej w swoich departamentach.
SELECT ename
FROM EMP
WHERE (sal, deptno) IN (SELECT MAX(sal), deptno
                            FROM EMP
                            GROUP BY deptno); 

-- Zadanie 2
-- ZnajdŸ pracowników, którzy zarabiaj¹ powy¿ej œredniej w ich departamentach.
SELECT ename
FROM EMP e
WHERE sal > (SELECT AVG(sal) 
                FROM EMP emp
                WHERE e.deptno=emp.deptno);

-- Zadanie 3
-- ZnajdŸ pracowników o najni¿szych zarobkach w ich stanowiskach.                
SELECT ename
FROM EMP e
WHERE sal = (SELECT MIN(sal)
                FROM EMP emp
                where e.job=emp.job);

-- Zadanie 4
-- ZnajdŸ za pomoc¹ predykatu EXISTS pracowników, którzy posiadaj¹ podw³adnych.                
SELECT ename
FROM EMP e
WHERE EXISTS (SELECT ename
                FROM EMP emp
                WHERE e.mgr=emp.empno);

-- Zadanie 5
-- ZnajdŸ pracowników, których departament nie wystêpuje w tabeli DEPT.                
SELECT ename
FROM EMP e
WHERE NOT EXISTS (SELECT ename
                    FROM DEPT d
                    WHERE d.deptno=e.deptno);

-- Zadanie 6
-- Stosuj¹c podzapytanie, znajdŸ nazwy i lokalizacjê departamentów, które nie zatrudniaj¹ ¿adnych pracowników.
SELECT d.dname, loc
FROM DEPT d
WHERE NOT EXISTS (SELECT ename
                    FROM EMP e
                    WHERE e.deptno=d.deptno);

-- Zadanie 7
-- ZnajdŸ pracowników zarabiaj¹cych maksymaln¹ pensjê na ich stanowiskach pracy. 
-- Wynikowe rekordy uporz¹dkuj wed³ug malej¹cych zarobków.                    
SELECT ename
FROM EMP e
WHERE sal = (SELECT MAX(sal)
                FROM EMP emp
                WHERE e.job=emp.job)
ORDER BY sal DESC;

-- Zadanie 8
-- ZnajdŸ pracowników zarabiaj¹cych minimaln¹ pensjê w ich grupach zarobkowych. 
-- Wynikowe rekordy uporz¹dkuj wed³ug malej¹cych grup zarobkowych.
SELECT ename, sal
FROM EMP e
INNER JOIN SALGRADE s
ON e.sal BETWEEN s.losal AND s.hisal
WHERE (sal, grade) IN (SELECT MIN(sal), grade
                        FROM EMP emp
                        INNER JOIN SALGRADE sg
                        ON emp.sal BETWEEN sg.losal AND sg.hisal
                        GROUP BY grade)
ORDER BY sal DESC;

-- Zadanie 9
-- Wska¿ dla ka¿dego departamentu ostatnio zatrudnionych pracowników. Wynikowe rekordy uporz¹dkuj wed³ug dat zatrudnienia.
SELECT ename, deptno, hiredate
FROM EMP e
WHERE (hiredate, deptno) IN (SELECT MAX(hiredate), deptno
                                FROM EMP emp
                                GROUP BY deptno);

-- Zadanie 10
-- Podaj nazwisko, pensjê i nazwê departamentu pracowników, których p³aca przekracza œredni¹ ich grup zarobkowych. 
SELECT ename, sal, dname
FROM EMP e, DEPT d, SALGRADE sg, (SELECT AVG(sal) salary, grade gr
                                    FROM EMP emp
                                    INNER JOIN SALGRADE s
                                    ON emp.sal BETWEEN s.losal AND s.hisal
                                    Group BY grade) 
WHERE (e.deptno=d.deptno) AND (e.sal BETWEEN sg.losal AND sg.hisal) AND (sg.grade=gr) AND (e.sal>salary);

-- Zadanie 11
-- Stosuj¹c podzapytanie znajdŸ pracowników przypisanych do nieistniej¹cych departamentów.
SELECT dname
FROM DEPT d
WHERE NOT EXISTS (SELECT 'anything'
                    FROM EMP e
                    WHERE d.deptno=e.deptno);

-- Zadanie 12
-- Wska¿ trzech najlepiej zarabiaj¹cych pracowników w firmie. Podaj ich nazwiska i pensje.         
SELECT ename, sal
FROM EMP e
WHERE 3 > (SELECT COUNT(*)
            FROM EMP emp
            WHERE e.sal < emp.sal);
