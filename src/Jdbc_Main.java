
import java.io.IOException;
import java.util.List;

import com.naver.dao.Jdbc_Dao;

import net.daum.vo.Jdbc_vo;

public class Jdbc_Main {

	public static void main(String[] args)  {
	
		Jdbc_Dao jd = new Jdbc_Dao();
		List<Jdbc_vo> jtest = jd.Jdbc_list();

		int empNo = Integer.parseInt(br.readLine());

		System.out.println("이름 입력:");
		String empName = br.readLine();

		System.out.println("직업 입력:");
		String job = br.readLine();

		System.out.println("월급 입력:");
		int sal = Integer.parseInt(br.readLine());

		System.out.println("보너스 입력:");
		int comm = Integer.parseInt(br.readLine());

		System.out.println("사원번호 입력:");
		   Jdbc_vo jdbcVo = new Jdbc_vo(empNo, empName, job, sal, comm, deptNo);

	        Jdbc_Dao jd = new Jdbc_Dao();
	        jd.Jdbc_insert(jdbcVo);
		}
	}
