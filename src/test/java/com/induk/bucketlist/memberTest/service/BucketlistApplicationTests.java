package com.induk.bucketlist.memberTest.service;

import com.induk.bucketlist.domain.Member;
import com.induk.bucketlist.repository.MemberRepository;
import com.induk.bucketlist.service.MemberService;
import org.apache.ibatis.session.SqlSession;
import org.junit.After;
import org.junit.Before;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.boot.test.autoconfigure.MybatisTest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.ImportAutoConfiguration;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase.Replace;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.transaction.annotation.Transactional;

import static org.junit.Assert.fail;
import static org.junit.jupiter.api.Assertions.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.List;

import static org.junit.Assert.fail;

@AutoConfigureTestDatabase(replace = Replace.NONE)
@MybatisTest
class BucketlistApplicationTests {

	@Autowired
	MemberRepository memberRepository;

	@Before
	public void setUp() throws Exception {

	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void findByEmail() {
		Member member1 = new Member();
		member1.setEmail("member1");
		member1.setPassword("member*");

		List<Member> list = memberRepository.findAll();

		System.out.println(list.get(1).getEmail());
	}

}