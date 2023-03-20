package com.project.movie.order.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("orderVO")
public class OrderVO {

	// movie_details table
	private int movie_id;
	private String movie_title;
	private String movie_genre;
	private String movie_time;
	private String movie_director;
	private String movie_actor;
	private String movie_story;
	private String movie_openday;
	private String movie_rank;
	private String movie_producer;
	private String movie_status;
	private String movie_screening_date;
	private int movie_people_qty;
	private String movie_running_time;
	private int ticket_number;
	private Date pay_order_time;
	private String card_number;
	private String card_com_name;
	private String movie_price;
	// movie_details table

	// moovie_seat table
	private String movie_place;
	private String movie_seat_number;
	private String seatstatus;
	// moovie_seat table

	// movie_detail_image
	private String movie_filename;
	// movie_detail_image

	public String getCard_number() {
		return card_number;
	}

	public void setCard_number(String card_number) {
		this.card_number = card_number;
	}

	public String getCard_com_name() {
		return card_com_name;
	}

	public void setCard_com_name(String card_com_name) {
		this.card_com_name = card_com_name;
	}

	public String getMovie_price() {
		return movie_price;
	}

	public void setMovie_price(String movie_price) {
		this.movie_price = movie_price;
	}

	public String getMovie_running_time() {
		return movie_running_time;
	}

	public Date getPay_order_time() {
		return pay_order_time;
	}

	public void setPay_order_time(Date pay_order_time) {
		this.pay_order_time = pay_order_time;
	}

	public int getTicket_number() {
		return ticket_number;
	}

	public void setTicket_number(int ticket_number) {
		this.ticket_number = ticket_number;
	}

	public void setMovie_running_time(String movie_running_time) {
		this.movie_running_time = movie_running_time;
	}

	public int getMovie_people_qty() {
		return movie_people_qty;
	}

	public void setMovie_people_qty(int movie_people_qty) {
		this.movie_people_qty = movie_people_qty;
	}

	public String getMovie_status() {
		return movie_status;
	}

	public void setMovie_status(String movie_status) {
		this.movie_status = movie_status;
	}

	public int getMovie_id() {
		return movie_id;
	}

	public String getMovie_filename() {
		return movie_filename;
	}

	public void setMovie_filename(String movie_filename) {
		this.movie_filename = movie_filename;
	}

	public String getMovie_place() {
		return movie_place;
	}

	public void setMovie_place(String movie_place) {
		this.movie_place = movie_place;
	}

	public String getMovie_seat_number() {
		return movie_seat_number;
	}

	public void setMovie_seat_number(String movie_seat_number) {
		this.movie_seat_number = movie_seat_number;
	}

	public String getSeatstatus() {
		return seatstatus;
	}

	public void setSeatstatus(String seatstatus) {
		this.seatstatus = seatstatus;
	}

	public void setMovie_id(int movie_id) {
		this.movie_id = movie_id;
	}

	public String getMovie_time() {
		return movie_time;
	}

	public void setMovie_time(String movie_time) {
		this.movie_time = movie_time;
	}

	public String getMovie_director() {
		return movie_director;
	}

	public void setMovie_director(String movie_director) {
		this.movie_director = movie_director;
	}

	public String getMovie_actor() {
		return movie_actor;
	}

	public void setMovie_actor(String movie_actor) {
		this.movie_actor = movie_actor;
	}

	public String getMovie_story() {
		return movie_story;
	}

	public void setMovie_story(String movie_story) {
		this.movie_story = movie_story;
	}

	public String getMovie_openday() {
		return movie_openday;
	}

	public void setMovie_openday(String movie_openday) {
		this.movie_openday = movie_openday;
	}

	public String getMovie_rank() {
		return movie_rank;
	}

	public void setMovie_rank(String movie_rank) {
		this.movie_rank = movie_rank;
	}

	public String getMovie_producer() {
		return movie_producer;
	}

	public void setMovie_producer(String movie_producer) {
		this.movie_producer = movie_producer;
	}

	public String getMovie_title() {
		return movie_title;
	}

	public void setMovie_title(String movie_title) {
		this.movie_title = movie_title;
	}

	public String getMovie_genre() {
		return movie_genre;
	}

	public void setMovie_genre(String movie_genre) {
		this.movie_genre = movie_genre;
	}

	public String getMovie_screening_date() {
		return movie_screening_date;
	}

	public void setMovie_screening_date(String movie_screening_date) {
		this.movie_screening_date = movie_screening_date;
	}

}
