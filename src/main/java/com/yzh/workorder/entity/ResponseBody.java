package com.yzh.workorder.entity;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.*;

import java.io.Serializable;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@ApiModel("接口返回实体")
public class ResponseBody<T> implements Serializable {
    private static final long serialVersionUID = -8987146499044811408L;
    /**
     * 返回状态
     */
    @ApiModelProperty("返回状态")
    private Integer code;
    /**
     * 返回信息
     */
    @ApiModelProperty("返回信息")
    private String message;
    /**
     * 返回数据
     */
    @ApiModelProperty("返回数据")
    private T data;
}
