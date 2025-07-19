package org.example.WebServiceHW3.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class FurnitureAddDAO {
    @Autowired
    JdbcTemplate jdbcTemplate;

}
