package com.pac.gestoreeventi;


import java.sql.Time;
import java.text.DateFormat;
import java.util.Date;

import org.junit.jupiter.api.Test;

import static org.assertj.core.api.Assertions.assertThat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.modelmapper.ModelMapper;

import com.pac.gestoreeventi.reservationManagement.*;

@DataJpaTest
@AutoConfigureTestDatabase(replace = AutoConfigureTestDatabase.Replace.NONE)
class EventRepositoryTest {

	@Autowired
	private ReservationRepository underTest;
	
	@Test
	void findById() {
			
		//given
		Date date = new Date(100);
		Reservation expected = new Reservation(1, date, true);
		underTest.save(expected);
		
		//when
		Event result = underTest.findById(expected.getId()).get();
		
		//then
		assertThat(expected.getId()).isEqualTo(result.getId());
	}
}