--------------------------------------------------------------------------------------------------------------------------------
-- CZʌ� I

-- Zadanie 1
-- Wypisz numery departament�w, nazwiska pracownik�w oraz numery pracownicze ich szef�w z tabeli EMP.
SELECT deptno, ename, mgr
From EMP;

-- Zadanie 2
-- Wypisz wszystkie warto�ci wszystkich kolumn z tabeli EMP.
SELECT *
FROM EMP;

-- Zadanie 3
-- Wylicz warto�� rocznej pensji podstawowej (12 p�ac miesi�cznych) dla ka�dego pracownika.
SELECT ename, 12*SAL
FROM EMP;

-- Zadanie 4
-- Wypisz nazwisko i warto�ci rocznej pensje podstawowej ka�dego pracownika, je�li ka�dy dostanie podwy�k� o 250.
SELECT ename, 12*(SAL+250)
FROM EMP;

-- Zadanie 5
-- Wypisz nazwisko i warto�ci rocznej pensji podstawowej ka�dego pracownika. Wynikow� kolumn� nazwij (zaetykietuj) 
-- nag��wkiem Roczna.
SELECT ename || ' ' || 12*SAL Roczna
FROM EMP;

-- Zadanie 6
-- Kolumn� zawieraj�c� wyniki operacji sal * 12 opatrz nag��wkiem P�aca Roczna.
SELECT ename, 12*sal "Placa Roczna"
FROM EMP;

-- Zadanie 7
-- Wypisz w jednej kolumnie po��czone (skonkatenowane) numery i nazwiska pracownik�w. Kolumn� wynikow� zaetykietuj 
-- nag��wkiem Zatrudniony.
SELECT empno || ' ' || ename "Zatrudniony"
FROM EMP;

-- Zadanie 8
-- Utw�rz zapytanie zwracaj�ce tekst: �Pracownik numer i nazwisko pracownika pracuje w dziale nr numer dzia�u i zarabia p�aca� 
-- z nag��wkiem Dane pracownika.
SELECT 'Pracownik ' || empno || ': ' || ename || ' pracuje w dziale numer ' || deptno || ' i zarabia '|| sal "Dane pracownika"
FROM EMP;

-- Zadanie 9
-- Dla ka�dego pracownika wypisz jego nazwisko i ca�kowite roczne dochody (z uwzgl�dnieniem prowizji, 
-- czyli 12 p�ac miesi�cznych + prowizja).
SELECT ename, 12*sal + NVL(comm, 0)
FROM EMP;

-- Zadanie 10
-- Wypisz wszystkie numery departament�w wyst�puj�ce w tabeli EMP.
SELECT deptno
FROM EMP;

-- Zadanie 11
-- Wypisz wszystkie r�ne numery departament�w wyst�puj�ce w tabeli EMP.
SELECT DISTINCT deptno
FROM EMP;

-- Zadanie 12
-- Wypisz wszystkie wzajemnie r�ne kombinacje warto�ci deptno i job.
SELECT DISTINCT deptno, job
FROM EMP;

-- Zadanie 13
-- Posortuj rosn�co wszystkie dane tabeli EMP wed�ug warto�ci kolumny ename.
SELECT *
FROM EMP
ORDER BY ename;

-- Zadanie 14
-- Posortuj malej�co wszystkie dane tabeli EMP wed�ug daty zatrudnienia (hiredate), pocz�wszy od ostatnio zatrudnionych.
SELECT *
FROM EMP
ORDER BY hiredate DESC;

-- Zadanie 15
-- Posortuj dane tabeli EMP wed�ug wzrastaj�cej warto�ci kolumny deptno, oraz malej�cych warto�ci kolumny sal
SELECT *
FROM EMP
ORDER BY deptno ASC, sal DESC;


--------------------------------------------------------------------------------------------------------------------------------
-- CZʌ� II

-- Zadanie 1
-- Wypisz nazwiska, numery pracownik�w, stanowiska pracy, p�ac� i numery departament�w wszystkich zatrudnionych 
-- na stanowisku CLERK.
SELECT ename, empno, job, sal, deptno
FROM EMP
WHERE job='CLERK';

-- Zadanie 2
-- Wypisz wszystkie nazwy i numery departament�w wi�ksze od 20.
SELECT deptno, dname
FROM DEPT
WHERE deptno > 20;

-- Zadanie 3
-- Wypisz nazwiska pracownik�w, kt�rych prowizja przekracza miesi�czn� pensj�.
SELECT ename
FROM EMP
WHERE sal < comm;

-- Zadanie 4
-- Znajd� wszystkie dane tych pracownik�w, kt�rych zarobki mieszcz� si� w przedziale pomi�dzy 1000 a 2000.
SELECT ename, sal
FROM EMP
WHERE sal between 1000 and 2000;

-- Zadanie 5
-- Znajd� nazwiska i numery pracownik�w, kt�rych bezpo�rednimi szefami s� 7902, 7566 lub 7788.
SELECT ename, empno, mgr
FROM EMP
WHERE mgr in(7902,7566,7788);

-- Zadanie 6
-- Znajd� nazwiska pracownik�w zaczynaj�ce si� na liter� S.
SELECT ename
FROM EMP
WHERE ename like 'S%';

-- Zadanie 7
-- Znajd� czteroliterowe nazwiska pracownik�w.
SELECT ename
FROM EMP
WHERE ename like '____';

-- Zadanie 8
-- Znajd� wszystkie dane pracownik�w, kt�rzy nie posiadaj� szefa.
SELECT *
FROM EMP
WHERE mgr is null;

-- Zadanie 9
-- Znajd� dane tych pracownik�w, kt�rych zarobki s� poza przedzia�em <1000, 2000>.
SELECT *
FROM EMP
WHERE sal not between 1000 AND 2000;

-- Zadanie 10
-- Znajd� nazwiska pracownik�w zaczynaj�ce si� na liter� M.
SELECT ename
FROM EMP
WHERE ename not like 'M%';

-- Zadanie 11
-- Znajd� dane tych pracownik�w, kt�rzy maj� szefa.
SELECT *
FROM EMP
WHERE mgr is not null;

-- Zadanie 12
-- Znajd� dane tych pracownik�w zatrudnionych na stanowisku CLERK, kt�rych zarobki mieszcz� si� w przedziale <1000, 2000>.
SELECT *
FROM EMP
WHERE job='CLERK' AND sal between 1000 AND 2000;

-- Zadanie 13
-- Znajd� dane tych pracownik�w, kt�rzy s� zatrudnieni na stanowisku CLERK, lub ich zarobki 
-- mieszcz� si� w przedziale <1000, 2000>.
SELECT *
FROM EMP
WHERE job='CLERK' OR sal between 1000 AND 2000;

-- Zadanie 14
-- Znajd� wszystkich pracownik�w zatrudnionych na stanowisku MANAGER z pensj� powy�ej 1500, oraz wszystkich 
-- na stanowisku SALESMAN.
SELECT *
FROM EMP
WHERE job='MANAGER' AND sal>1500 OR job='SALESMAN';

-- Zadanie 15
-- Znajd� wszystkich pracownik�w zatrudnionych na stanowisku MANAGER, lub na stanowisku SALESMAN z pensj� powy�ej 1500.
SELECT *
FROM EMP
WHERE (job='MANAGER' OR job='SALESMAN') AND sal>1500;

-- Zadanie 16
-- Znajd� wszystkich pracownik�w zatrudnionych na stanowisku MANAGER ze wszystkich departament�w, wraz ze wszystkimi 
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
-- Znajd� dane tych pracownik�w zatrudnionych na stanowisku CLERK, kt�rych zarobki nie mieszcz� si� w przedziale <1000, 2000>.
SELECT *
FROM EMP
WHERE sal not between 1000 and 2000;

-- Zadanie 20
-- Wypisz numery i nazwy departament�w, sortuj�c wynikowe rekordy rosn�co wed�ug numer�w departament�w.
SELECT deptno, dname
FROM DEPT
ORDER BY deptno ASC;

-- Zadanie 21
-- Wypisz wszystkie wzajemnie r�ne (niepowtarzaj�ce si�) stanowiska pracy.
SELECT DISTINCT job
FROM EMP;

-- Zadanie 22
-- Wypisz nazwiska, stanowiska i numery departament�w pracownik�w zatrudnionych 
-- w departamentach 10 i 20 w kolejno�ci alfabetycznej nazwisk pracownik�w.
SELECT ename, job, deptno
FROM EMP
WHERE deptno in (10,20)
ORDER BY ename;

-- Zadanie 23
-- Wypisz nazwiska, stanowiska i numery departament�w wszystkich pracownik�w z departamentu 20 zatrudnionych 
-- na stanowisku CLERK.
SELECT ename, job, deptno
FROM EMP
WHERE deptno='20' AND job='CLERK';

-- Zadanie 24
-- Wypisz nazwiska, w kt�rych wyst�puje ci�g liter �TH� lub �LL�.
SELECT ename
FROM EMP
WHERE ename like '%TH%' OR ename like '%LL%';

-- Zadanie 25
-- Wypisz nazwisko, stanowisko i pensj� pracownik�w, kt�rzy posiadaj� szefa.
SELECT ename, job, sal
FROM EMP
WHERE mgr is not null;

-- Zadanie 26
-- Dla ka�dego pracownika wypisz jego nazwisko i ca�oroczne dochody.
SELECT ename, 12*sal+nvl(comm,0) Roczne_dochody
FROM EMP;

-- Zadanie 27
-- Wypisz numer departamentu i dat� zatrudnienia pracownik�w, kt�rzy zostali zatrudnieni w 1982 r.
SELECT ename, deptno, hiredate
FROM EMP
WHERE HIREDATE like '82%'; 

-- Zadanie 28
-- Wypisz nazwiska, roczn� pensj� oraz prowizj� tych wszystkich SALESMAN��w, kt�rych miesi�czna pensja przekracza prowizj�. 
-- Wyniki posortuj wed�ug malej�cych zarobk�w, potem nazwisk (rosn�co).
SELECT ename, 12*sal Roczna_pensja, comm
FROM EMP
WHERE job='SALESMAN' AND sal>comm
ORDER BY sal DESC, ename ASC;


--------------------------------------------------------------------------------------------------------------------------------
-- CZʌ� III

-- Zadanie 1
-- Wypisz wszystkie dane z tabel EMP i DEPT.
SELECT *
FROM EMP e, DEPT d
WHERE e.deptno=d.deptno;

-- Zadanie 2
-- Wybierz nazwiska wszystkich pracownik�w, oraz nazwy departament�w w kt�rych s� zatrudnieni. Zwracane rekordy posortuj 
-- w kolejno�ci alfabetycznej nazwisk.
SELECT ename, dname
FROM EMP e
INNER JOIN DEPT d
ON e.deptno=d.deptno
ORDER BY ename;

-- Zadanie 3
-- Wybierz nazwiska wszystkich pracownik�w, wraz z numerami, nazwami i lokalizacjami departament�w, 
-- w kt�rych s� oni zatrudnieni.
SELECT e.ename, d.deptno, d.dname, d.loc
FROM EMP e
INNER JOIN DEPT d
ON e.deptno=d.deptno;

-- Zadanie 4
-- Dla pracownik�w o miesi�cznej pensji powy�ej 1500 podaj ich nazwiska, miejsca usytuowania ich departament�w, 
-- oraz nazwy tych departament�w.
SELECT e.ename, d.deptno, d.dname, d.loc, e.sal
FROM EMP e
INNER JOIN DEPT d
ON e.deptno=d.deptno
WHERE sal>1500;

-- Zadanie 5
-- Utw�rz list� pracownik�w podaj�c ich nazwisko, zaw�d, pensj� i stopie� zaszeregowania (grup� zarobkow�).
SELECT e.ename, e.job, e.sal, s.grade
FROM EMP e
INNER JOIN SALGRADE s
ON e.sal BETWEEN s.losal AND s.hisal;

-- Zadanie 6
-- Wypisz informacje o pracownikach, kt�rych zarobki odpowiadaj� 3 klasie zarobkowej.
SELECT e.ename, e.job, e.sal, s.grade
FROM EMP e
INNER JOIN SALGRADE s
ON e.sal BETWEEN s.losal AND s.hisal AND s.grade='3';

-- Zadanie 7
-- Wybierz pracownik�w zatrudnionych w DALLAS.
SELECT e.ename, d.deptno, d.dname, d.loc
FROM EMP e
INNER JOIN DEPT d
ON e.deptno=d.deptno
WHERE d.loc='DALLAS';

-- Zadanie 8
-- Wybierz pracownik�w z dzia�u 30 i 40 (nazwisko, nr. dzia�u, nazwa dzia�u, lokalizacja). 
-- Wypisz r�wnie� dane dzia�u, 40 w kt�rym niema pracownik�w.
SELECT e.ename, d.deptno, d.dname, d.loc
FROM EMP e
RIGHT OUTER JOIN DEPT d
ON e.deptno=d.deptno
WHERE d.deptno in (30,40);

-- Zadanie 9
-- Wypisz nazwisko, nazw� i lokalizacje dzia�u wszystkich pracownik�w. Uwzgl�dnij tak�e tych pracownik�w, 
-- kt�rzy nie s� przypisani do �adnego dzia�u.
SELECT e.ename, d.deptno, d.dname, d.loc
FROM EMP e
LEFT OUTER JOIN DEPT d
ON e.deptno=d.deptno;

-- Zadanie 10
-- Wypisz nazwiska wszystkich pracownik�w oraz nazwy wszystkich dzia��w. W wyniku maja pojawi� si� nazwiska pracownik�w nie 
-- przypisanych do �adnych dzia��w, a tak�e nazwy dzia��w, w kt�rych nie s� zatrudnieni pracownicy.
SELECT e.ename, d.deptno, d.dname, d.loc
FROM EMP e
FULL OUTER JOIN DEPT d
ON e.deptno=d.deptno;

-- Zadanie 11
-- Wypisz nazwiska pracownik�w, kt�rzy zarabiaj� mniej od swoich kierownik�w.
SELECT e.ename
FROM EMP e
INNER JOIN EMP emp
ON e.mgr=emp.empno
WHERE e.sal<emp.sal;

-- Zadanie 12
-- Do rozwi�zania zadania 11 do��cz nazwiska szef�w, oraz p�ace szef�w i ich podw�adnych.
SELECT e.ename,e.sal, emp.ename, emp.sal
FROM EMP e
INNER JOIN EMP emp
ON e.mgr=emp.empno
WHERE e.sal<emp.sal;

-- Zadanie 13
-- Wykorzystuj�c operacj� na zbiorach wynik�w, wypisz stanowiska wyst�puj�ce w dziale 10 lub w dziale 30.
SELECT job
FROM EMP 
WHERE deptno='10'

UNION

SELECT job
FROM EMP 
WHERE deptno='30';

-- Zadanie 14
-- Wykorzystuj�c operacj� na zbiorach wynik�w, wypisz stanowiska wyst�puj�ce zar�wno w dziale 10, jak i w dziale 30.
SELECT job
FROM EMP 
WHERE deptno='10'

INTERSECT

SELECT job
FROM EMP 
WHERE deptno='30';

-- Zadanie 15
-- Wykorzystuj�c operacj� na zbiorach wynik�w, wypisz stanowiska wyst�puj�ce w dziale 10, a nie wyst�puj�ce w dziale 30.
SELECT job FROM EMP WHERE deptno='10'
MINUS
SELECT job FROM EMP WHERE deptno='30';


--------------------------------------------------------------------------------------------------------------------------------
-- CZʌ� IV

-- Zadanie 1
-- Oblicz �redni zarobek w firmie, nazywaj�c wynikow� kolumn� �rednia p�aca
SELECT AVG(sal) "Srednia placa"
FROM EMP;

-- Zadanie 2
-- Znajd� minimalne zarobki na stanowisku CLERK.
SELECT MIN(sal)
FROM EMP
WHERE job='CLERK';

-- Zadanie 3
-- Policz pracownik�w zatrudnionych w departamencie 20.
SELECT COUNT(*)
FROM EMP
WHERE deptno='20';

-- Zadanie 4
-- Oblicz �rednie zarobki na ka�dym ze stanowisk pracy.
SELECT job, AVG(sal)
FROM EMP
GROUP BY job;

-- Zadanie 5
-- Obliczy �rednie zarobki na ka�dym ze stanowisk pracy, z wyj�tkiem stanowiska MANAGER.
SELECT job, AVG(sal)
FROM EMP
WHERE job<>'MANAGER'
GROUP BY job;

-- Zadanie 6
-- Obliczy �rednie zarobki na ka�dym ze stanowisk pracy w ka�dym departamencie.
SELECT deptno, job, AVG(sal)
FROM EMP
GROUP BY deptno, job;

-- Zadanie 7
-- Oblicz maksymalne zarobki dla ka�dego stanowiska.
SELECT job, MAX(sal)
FROM EMP
GROUP BY job;

-- Zadanie 8
-- Wybierz �rednie zarobki tych departament�w, kt�re zatrudniaj� wi�cej ni� trzech pracownik�w.
SELECT deptno, AVG(sal)
FROM EMP
GROUP BY deptno
HAVING COUNT(*)>3;

-- Zadanie 9
-- Wybierz stanowiska, na kt�rych �redni zarobek wynosi 3000 lub wi�cej.
SELECT job, AVG(sal)
FROM EMP
GROUP BY job
HAVING AVG(sal)>=3000;

-- Zadanie 10
-- Znajd� �rednie miesi�czne pensje oraz �rednie roczne dochody dla ka�dego stanowiska (pami�taj o prowizji).
SELECT job, AVG(sal), AVG(12*sal + 12*NVL(comm,0))
FROM EMP
GROUP BY job;

-- Zadanie 11
-- Znajd� departamenty zatrudniaj�ce wi�cej ni� trzech pracownik�w.
SELECT deptno, COUNT(*)
FROM EMP
GROUP BY deptno
HAVING COUNT(*)>3;

-- Zadanie 12
-- Sprawd�, czy wszystkie numery pracownik�w s� rzeczywi�cie wzajemnie r�ne.
SELECT empno
FROM EMP
GROUP BY empno
HAVING COUNT(*)>1;

-- Zadanie 13
-- Podaj najni�sze pensje wyp�acane podw�adnym swoich kierownik�w. Wyeliminuj grupy o minimalnych zarobkach ni�szych ni� 1000. 
-- Uporz�dkuj wyniki malej�co wed�ug wielko�ci pensji.
SELECT mgr, MIN(sal) 
FROM EMP
GROUP BY mgr
HAVING MIN(sal)>=1000
ORDER BY MIN(sal) DESC;

-- Zadanie 14
-- Policz, ilu pracownik�w ma dzia� maj�cy siedzib� w DALLAS.
SELECT COUNT(*)
FROM EMP e
INNER JOIN DEPT d
ON e.deptno = d.deptno
WHERE loc='DALLAS'
GROUP BY dname;

-- Zadanie 15
-- Podaj maksymalne zarobki dla ka�dej grupy zarobkowej.
SELECT s.grade, MAX(sal)
FROM EMP e
INNER JOIN SALGRADE s
ON e.sal between s.losal AND s.hisal
Group BY s.grade;

-- Zadanie 16
-- Sprawd�, kt�re warto�ci zarobk�w powtarzaj� si� i ilu pracownik�w je otrzymuje.
SELECT sal, COUNT(*)
FROM EMP
GROUP BY sal
HAVING COUNT(*)>1;

-- Zadanie 17
-- Podaj �redni zarobek pracownik�w z drugiej grupy zarobkowej.
SELECT AVG(sal)
FROM EMP e
INNER JOIN SALGRADE s
ON s.grade='2' AND e.sal between s.losal AND s.hisal;

-- Zadanie 18
-- Sprawd�, ilu podw�adnych ma ka�dy kierownik, podaj�c nazwisko kierownika.
SELECT mgr, COUNT(*)
FROM EMP 
GROUP BY mgr;

-- Zadanie 19
-- Podaj sum�, kt�r� zarabiaj� razem wszyscy pracownicy z pierwszej grupy zarobkowej.
SELECT SUM(sal)
FROM EMP e
INNER JOIN SALGRADE s
ON s.grade ='1' AND e.sal BETWEEN s.losal AND s.hisal; 


--------------------------------------------------------------------------------------------------------------------------------
-- CZʌ� V

-- Zadanie 1
-- Znajd� pracownik�w z pensj� r�wn� minimalnemu zarobkowi w firmie.
SELECT ename,sal
FROM EMP
WHERE sal = (SELECT MIN(sal)
                FROM EMP);

-- Zadanie 2
-- Znajd� wszystkich pracownik�w zatrudnionych na tym samym stanowisku, co BLAKE.                
SELECT ename
FROM EMP
WHERE job = (SELECT job
                FROM EMP
                WHERE ename='BLAKE');

-- Zadanie 3
-- Znajd� pracownik�w, kt�rych p�ace wynosz� tyle, ile najni�sze zarobki w poszczeg�lnych departamentach.                
SELECT ename
FROM EMP
WHERE sal IN (SELECT MIN(sal)
                FROM EMP
                GROUP BY deptno);

-- Zadanie 4
-- Znajd� pracownik�w o najni�szych zarobkach w ich departamentach.
SELECT ename, deptno
FROM EMP
WHERE (sal, deptno) IN (SELECT MIN(sal), deptno
                        FROM EMP
                        GROUP BY deptno);

-- Zadanie 5
-- Stosuj�c kwantyfikator ANY wybierz pracownik�w zarabiaj�cych powy�ej najni�szego zarobku z departamentu 30 
-- (czyli wi�cej od dowolnego pracownika z departamentu 30).                        
SELECT ename, deptno
FROM EMP
WHERE sal > ANY (SELECT sal
                    FROM EMP
                    WHERE deptno='30');

-- Zadanie 6
-- Stosuj�c kwantyfikator ALL znajd� pracownik�w, kt�rych zarobki s� wy�sze od pensji ka�dego pracownika z departamentu 30 
-- (czyli wi�ksze od najwy�szej pensji w departamencie 30).                    
SELECT ename, deptno 
FROM EMP
WHERE sal > ALL (SELECT sal
                    FROM EMP
                    WHERE deptno='30');

-- Zadanie 7
-- Wybierz departamenty, kt�rych �rednie zarobki przekraczaj� �redni zarobek departamentu 30.                    
SELECT deptno, AVG(sal)
FROM EMP
GROUP BY deptno
HAVING AVG(sal) > (SELECT AVG(sal)
                    FROM EMP
                    WHERE deptno='30');

-- Zadanie 8
-- Znajd� stanowisko, na kt�rym s� najwy�sze �rednie zarobki.                    
SELECT job, AVG(sal)
FROM EMP
GROUP BY job
HAVING AVG(sal) = (SELECT MAX(AVG(sal))
                FROM EMP
                GROUP BY job);

-- Zadanie 9
-- Znajd� pracownik�w, kt�rych zarobki przekraczaj� najwy�sze pensje z departamentu SALES.                
SELECT ename, sal
FROM EMP
WHERE sal > (SELECT MAX(sal)
                FROM EMP e
                INNER JOIN DEPT d
                ON e.deptno=d.deptno
                WHERE d.dname='SALES');

-- Zadanie 10
-- Znajd� pracownik�w, kt�rzy pracuj� na tym samym stanowisku, co pracownik o numerze 7369 i kt�rych zarobki s� wi�ksze 
-- ni� pracownika o numerze 7876.                
SELECT ename
FROM EMP
WHERE job = (SELECT job
                FROM EMP
                WHERE empno='7369')                
        AND (sal + NVL(comm,0)) > (SELECT sal + NVL(comm,0)
                                    FROM EMP
                                    WHERE empno='7876');

-- Zadanie 11
-- Wypisz nazwy dzia��w w kt�rych pracuj� urz�dnicy (CLERK).                                    
SELECT DISTINCT dname
FROM EMP e
INNER JOIN DEPT d
ON e.deptno=d.deptno
WHERE job='CLERK';


--------------------------------------------------------------------------------------------------------------------------------
-- CZʌ� VI

-- Zadanie 1
-- Znajd� pracownik�w, kt�rzy zarabiaj� najwi�cej w swoich departamentach.
SELECT ename
FROM EMP
WHERE (sal, deptno) IN (SELECT MAX(sal), deptno
                            FROM EMP
                            GROUP BY deptno); 

-- Zadanie 2
-- Znajd� pracownik�w, kt�rzy zarabiaj� powy�ej �redniej w ich departamentach.
SELECT ename
FROM EMP e
WHERE sal > (SELECT AVG(sal) 
                FROM EMP emp
                WHERE e.deptno=emp.deptno);

-- Zadanie 3
-- Znajd� pracownik�w o najni�szych zarobkach w ich stanowiskach.                
SELECT ename
FROM EMP e
WHERE sal = (SELECT MIN(sal)
                FROM EMP emp
                where e.job=emp.job);

-- Zadanie 4
-- Znajd� za pomoc� predykatu EXISTS pracownik�w, kt�rzy posiadaj� podw�adnych.                
SELECT ename
FROM EMP e
WHERE EXISTS (SELECT ename
                FROM EMP emp
                WHERE e.mgr=emp.empno);

-- Zadanie 5
-- Znajd� pracownik�w, kt�rych departament nie wyst�puje w tabeli DEPT.                
SELECT ename
FROM EMP e
WHERE NOT EXISTS (SELECT ename
                    FROM DEPT d
                    WHERE d.deptno=e.deptno);

-- Zadanie 6
-- Stosuj�c podzapytanie, znajd� nazwy i lokalizacj� departament�w, kt�re nie zatrudniaj� �adnych pracownik�w.
SELECT d.dname, loc
FROM DEPT d
WHERE NOT EXISTS (SELECT ename
                    FROM EMP e
                    WHERE e.deptno=d.deptno);

-- Zadanie 7
-- Znajd� pracownik�w zarabiaj�cych maksymaln� pensj� na ich stanowiskach pracy. 
-- Wynikowe rekordy uporz�dkuj wed�ug malej�cych zarobk�w.                    
SELECT ename
FROM EMP e
WHERE sal = (SELECT MAX(sal)
                FROM EMP emp
                WHERE e.job=emp.job)
ORDER BY sal DESC;

-- Zadanie 8
-- Znajd� pracownik�w zarabiaj�cych minimaln� pensj� w ich grupach zarobkowych. 
-- Wynikowe rekordy uporz�dkuj wed�ug malej�cych grup zarobkowych.
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
-- Wska� dla ka�dego departamentu ostatnio zatrudnionych pracownik�w. Wynikowe rekordy uporz�dkuj wed�ug dat zatrudnienia.
SELECT ename, deptno, hiredate
FROM EMP e
WHERE (hiredate, deptno) IN (SELECT MAX(hiredate), deptno
                                FROM EMP emp
                                GROUP BY deptno);

-- Zadanie 10
-- Podaj nazwisko, pensj� i nazw� departamentu pracownik�w, kt�rych p�aca przekracza �redni� ich grup zarobkowych. 
SELECT ename, sal, dname
FROM EMP e, DEPT d, SALGRADE sg, (SELECT AVG(sal) salary, grade gr
                                    FROM EMP emp
                                    INNER JOIN SALGRADE s
                                    ON emp.sal BETWEEN s.losal AND s.hisal
                                    Group BY grade) 
WHERE (e.deptno=d.deptno) AND (e.sal BETWEEN sg.losal AND sg.hisal) AND (sg.grade=gr) AND (e.sal>salary);

-- Zadanie 11
-- Stosuj�c podzapytanie znajd� pracownik�w przypisanych do nieistniej�cych departament�w.
SELECT dname
FROM DEPT d
WHERE NOT EXISTS (SELECT 'anything'
                    FROM EMP e
                    WHERE d.deptno=e.deptno);

-- Zadanie 12
-- Wska� trzech najlepiej zarabiaj�cych pracownik�w w firmie. Podaj ich nazwiska i pensje.         
SELECT ename, sal
FROM EMP e
WHERE 3 > (SELECT COUNT(*)
            FROM EMP emp
            WHERE e.sal < emp.sal);
