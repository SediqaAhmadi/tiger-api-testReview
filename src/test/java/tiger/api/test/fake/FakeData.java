package tiger.api.test.fake;

import java.util.Date;

import com.github.javafaker.Faker;
import com.ibm.icu.text.SimpleDateFormat;

public class FakeData {

	public static String getEmail() {
		Faker fake = new Faker();
		return fake.name().firstName() + fake.name().firstName() + "@gmail.com";
	}

	public static String getFirstName() {
		Faker fake = new Faker();
		return fake.name().firstName();
	}

	public static String getLaststName() {
		Faker fake = new Faker();
		return fake.name().lastName();
	}

	public static String getPhoneNumber() {
		Faker fake = new Faker();
		return fake.phoneNumber().cellPhone();

	}

	public static String getDOB() {
		Faker fake = new Faker();
		Date date = fake.date().birthday();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-mm-dd");
		return format.format(date);

	}

}