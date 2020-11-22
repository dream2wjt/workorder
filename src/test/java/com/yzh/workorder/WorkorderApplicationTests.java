package com.yzh.workorder;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.yzh.workorder.entity.UserAccount;
import com.yzh.workorder.service.IUserAccountService;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;


@RunWith(SpringRunner.class)
@SpringBootTest()
class WorkorderApplicationTests {

	@Autowired
	IUserAccountService userAccountService;
	@Test
	void contextLoads() {
	}
	@Test
	void selectUserByPhoneNo() {
		UserAccount userAccount = (UserAccount)userAccountService.findUserByPhoneNo("13100678595");
		System.out.println(userAccount);
	}

	@Test
	void getOne() {
		QueryWrapper<UserAccount> wrapper = new QueryWrapper<>();
		wrapper.eq("PHONE_NO", "13100678595");
		UserAccount userAccount = (UserAccount)userAccountService.getOne(wrapper, true);
		System.out.println(userAccount);
	}
}
