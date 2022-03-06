package com.example.demo.mapper;

import com.example.demo.model.ContentVo;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;

@Mapper
@Repository
@Transactional
public interface ContentMapper {

   List<HashMap<String, Object>> findAll();
   void saveContent(ContentVo contentVo);
}
