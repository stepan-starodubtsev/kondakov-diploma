import React from 'react';
import {Accordion, AccordionDetails, AccordionSummary, Box, Typography, useTheme} from "@mui/material";
import {tokens} from "../../theme.js";
import Header from "../../components/Header.jsx";
import ExpandMore from "@mui/icons-material/ExpandMore";

const FAQ = () => {
    const theme = useTheme();
    const colors = tokens(theme.palette.mode);


    return (
        <Box m={"20px"}>
            <Header title={"FAQ"} subtitle={"Frequently Asked Questions Page"}/>

            <Accordion>
                <AccordionSummary expandIcon={<ExpandMore/>}>
                    <Typography color={colors.greenAccent[500]} variant={"h5"}>
                        An important question
                    </Typography>
                </AccordionSummary>
                <AccordionDetails>
                    <Typography>
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse malesuada lacus ex,
                        sit amet blandit leo lobortis eget.
                    </Typography>
                </AccordionDetails>
            </Accordion>
            <Accordion>
                <AccordionSummary expandIcon={<ExpandMore/>}>
                    <Typography color={colors.greenAccent[500]} variant={"h5"}>
                        Another important question
                    </Typography>
                </AccordionSummary>
                <AccordionDetails>
                    <Typography>
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse malesuada lacus ex,
                        sit amet blandit leo lobortis eget.
                    </Typography>
                </AccordionDetails>
            </Accordion>
            <Accordion>
                <AccordionSummary expandIcon={<ExpandMore/>}>
                    <Typography color={colors.greenAccent[500]} variant={"h5"}>
                        Your favourite question
                    </Typography>
                </AccordionSummary>
                <AccordionDetails>
                    <Typography>
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse malesuada lacus ex,
                        sit amet blandit leo lobortis eget.
                    </Typography>
                </AccordionDetails>
            </Accordion>
            <Accordion>
                <AccordionSummary expandIcon={<ExpandMore/>}>
                    <Typography color={colors.greenAccent[500]} variant={"h5"}>
                        An important question
                    </Typography>
                </AccordionSummary>
                <AccordionDetails>
                    <Typography>
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse malesuada lacus ex,
                        sit amet blandit leo lobortis eget.
                    </Typography>
                </AccordionDetails>
            </Accordion>
            <Accordion>
                <AccordionSummary expandIcon={<ExpandMore/>}>
                    <Typography color={colors.greenAccent[500]} variant={"h5"}>
                        An important question
                    </Typography>
                </AccordionSummary>
                <AccordionDetails>
                    <Typography>
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse malesuada lacus ex,
                        sit amet blandit leo lobortis eget.
                    </Typography>
                </AccordionDetails>
            </Accordion>
            <Accordion>
            <AccordionSummary expandIcon={<ExpandMore/>}>
                <Typography color={colors.greenAccent[500]} variant={"h5"}>
                    An important question
                </Typography>
            </AccordionSummary>
            <AccordionDetails>
                <Typography>
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse malesuada lacus ex,
                    sit amet blandit leo lobortis eget.
                </Typography>
            </AccordionDetails>
        </Accordion>
        </Box>
    );
};

export default FAQ;