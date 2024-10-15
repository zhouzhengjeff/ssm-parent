package com.hnguigu.ssm.converter;

import org.apache.commons.lang3.time.DateUtils;
import org.springframework.core.convert.converter.Converter;
import org.springframework.util.StringUtils;

import java.text.ParseException;
import java.util.Date;

public class UtilDateConverter implements Converter<String, Date> {

    private String[] patterns;

    public void setPatterns(String[] patterns) {
        this.patterns = patterns;
    }

    @Override
    public Date convert(String source) {
        Date date = null;

        if (StringUtils.isEmpty(source)) {
            throw new IllegalArgumentException("");
        }

        try {
            date = DateUtils.parseDate(source, this.patterns);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        return date;
    }
}
