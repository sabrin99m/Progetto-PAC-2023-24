package com.example.demo;


import java.sql.Time;
import java.util.Date;

import org.junit.jupiter.api.Test;

import static org.assertj.core.api.Assertions.assertThat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;

@DataJpaTest
@AutoConfigureTestDatabase(replace = AutoConfigureTestDatabase.Replace.NONE)
class EventRepositoryTest {

	@Autowired
	private EventRepository underTest;
	
	@Test
	void findById() {
			
		String stringaTest = "test";
		//given
		@SuppressWarnings("deprecation")
		Event expected = new Event(1, stringaTest, stringaTest, EventLevel.MEDIUM, new Date(2024, 01, 19), stringaTest, stringaTest, stringaTest, stringaTest, stringaTest, stringaTest, new Time(15, 30, 00), 4);
		
		underTest.save(expected);
		
		//when
		Event result = underTest.findById(1).get();
		
		//then
		assertThat(expected).isEqualTo(result);
	}
}
